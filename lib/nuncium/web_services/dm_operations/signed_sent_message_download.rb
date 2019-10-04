module Nuncium
  module WebServices
    module DmOperations
      class SignedSentMessageDownload < ::Nuncium::WebServices::DmOperations::Request
        ATTRS = [:dmID].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].SignedSentMessageDownload do
            values(xml)
          end
        end
      end
    end
  end
end
