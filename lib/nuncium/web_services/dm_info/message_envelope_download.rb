module Nuncium
  module WebServices
    module DmInfo
      class MessageEnvelopeDownload < ::Nuncium::WebServices::DmInfo::Request
        ATTRS = [:dmID].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].MessageEnvelopeDownload do
            values(xml)
          end
        end

        def response_wrapper
          ::Nuncium::Responses::Messages::Envelope
        end

        def call_reponse_wrapper(response)
          response_wrapper.new(response).message
        end
      end
    end
  end
end
