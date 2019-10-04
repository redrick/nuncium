##
#
# TODO: parsing those files and so...
module Nuncium
  module WebServices
    module DmOperations
      class CreateMultipleMessages < ::Nuncium::WebServices::DmOperations::Request
        ATTRS = %i[dmSenderOrgUnit dmSenderOrgUnitNum dbIDRecipient
                   dmRecipientOrgUnit dmRecipientOrgUnitNum dmToHands
                   dmAnnotation dmRecipientRefNumber dmSenderRefNumber
                   dmRecipientIdent dmSenderIdent dmLegalTitleLaw
                   dmLegalTitleYear dmLegalTitleSect dmLegalTitlePar
                   dmLegalTitlePoint dmPersonalDelivery dmAllowSubstDelivery
                   dmOVM dmPublishOwnID].freeze
        # + files:
        #   dmFiles: { dmFile: { dmEncodedContent: '', dmXMLContent: '' } }

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].CreateMultipleMessage do
            xml[:v20].dmEnvelope(dmType: 'WTF') do
              values(xml)
            end
          end
        end
      end
    end
  end
end
