module Nuncium
  module WebServices
    module DmOperations
      class MessageDownload < ::Nuncium::WebServices::DmOperations::Request
        ATTRS = [:dmID].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].MessageDownload do
            values(xml)
          end
        end

        def response_wrapper
          ::Nuncium::Responses::Message
        end

        def call_reponse_wrapper(response)
          response_wrapper.new(response).message
        end
      end
    end
  end
end
