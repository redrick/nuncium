module Nuncium
  module WebServices
    module DmOperations
      class SignedMessageDownload < ::Nuncium::WebServices::DmOperations::Request
        ATTRS = [:dmID].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].SignedMessageDownload do
            values(xml)
          end
        end
      end
    end
  end
end
