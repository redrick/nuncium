# rubocop:disable Metrics/ClassLength
module Nuncium
  class DataMessage
    ATTRIBUTES = %w[dmType dmOrdinal dmID dbIDSender dmSender
                    dmSenderAddress dmSenderType dmRecipient dmRecipientAddress
                    dmSenderOrgUnit dmSenderOrgUnitNum dbIDRecipient dmRecipientOrgUnit
                    dmRecipientOrgUnitNum dmToHands dmAnnotation dmRecipientRefNumber
                    dmSenderRefNumber dmRecipientIdent dmSenderIdent dmLegalTitleLaw
                    dmLegalTitleYear dmLegalTitleSect dmLegalTitlePar dmLegalTitlePoint
                    dmPersonalDelivery dmAllowSubstDelivery dmMessageStatus
                    dmAttachmentSize dmDeliveryTime dmAcceptanceTime dmHash
                    dmQTimestamp dmAttachments dmAmbiguousRecipient].freeze

    attr_accessor(*ATTRIBUTES)

    def self.find(dmID)
      Nuncium::WebServices::DmOperations::MessageDownload
        .call(dmID: dmID)
    end

    def download(destination = '/tmp')
      path = "#{destination}/#{dmID}.zfo"
      File.open(path, 'wb') do |f|
        f.write(Base64.decode64(signed.body.dmSignature))
      end
      path
    end

    def initialize(params = {})
      @params = params.dup
      @status_info = @params.delete('dmDm')
      @dmAttachments = load_attachments
      @dmEvents = load_events
      unified_params = @status_info ? @status_info.merge(@params) : params
      unified_params.each do |key, value|
        raise "Not valid attribute of DataMessage #{key}" unless ATTRIBUTES.include?(key)
        instance_variable_set("@#{key}", parsed_value(value))
      end
    end

    def verify
      Nuncium::WebServices::DmInfo::VerifyMessage
        .call(dmID: dmID)
    end

    def authenticate
      Nuncium::WebServices::DmOperations::AuthenticateMessage
        .call(dmMessage: signed.body.dmSignature)
    end

    def signed
      Nuncium::WebServices::DmOperations::SignedMessageDownload
        .call(dmID: dmID)
    end

    def author
      Nuncium::WebServices::DmInfo::GetMessageAuthor
        .call(dmID: dmID)
    end

    def delivery_info
      Nuncium::WebServices::DmInfo::GetDeliveryInfo
        .call(dmID: dmID)
    end

    def signed_delivery_info
      Nuncium::WebServices::DmInfo::GetSignedDeliveryInfo
        .call(dmID: dmID)
    end

    def envelope
      Nuncium::WebServices::DmInfo::MessageEnvelopeDownload
        .call(dmID: dmID)
    end

    def confirm_delivery
      Nuncium::WebServices::DmInfo::ConfirmDelivery
        .call(dmID: dmID)
    end

    def mark_as_downloaded
      Nuncium::WebServices::DmInfo::MarkMessageAsDownloaded
        .call(dmID: dmID)
    end

    def destroy(options = {})
      Nuncium::WebServices::DmInfo::EraseMessage
        .call(options.merge(dmID: dmID))
    end

    def sent?
      dbIDSender == ::Nuncium.configuration.data_box
    end

    def received?
      dbIDSender != ::Nuncium.configuration.data_box
    end

    private

    def load_events
      return {} if @params['dmEvents'].blank?
      events_hash = @params.delete('dmEvents')['dmEvent']
      if events_hash.is_a?(Array)
        events_hash.map do |event|
          ::Nuncium::Responses::Messages::Event.new(event)
        end
      else
        ::Nuncium::Responses::Messages::Event.new(events_hash)
      end
    end

    def load_attachments
      return {} if @status_info&.dig('dmFiles').blank?
      attachments_hash = @status_info.delete('dmFiles')['dmFile']
      if attachments_hash.is_a?(Array)
        attachments_hash.map do |attachment|
          ::Nuncium::Responses::Messages::Attachment.new(attachment)
        end
      else
        [::Nuncium::Responses::Messages::Attachment.new(attachments_hash)]
      end
    end

    def parsed_value(value)
      return value unless value.is_a?(Hash)
      raise "Missing parse rule for #{value}" if value.keys.size > 1
      if value.keys.first == 'xsi:nil' && value.values.first == 'true'
        nil
      else
        false
      end
    end
  end
end
# rubocop:enable Metrics/ClassLength
