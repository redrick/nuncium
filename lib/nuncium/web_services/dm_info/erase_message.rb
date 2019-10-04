module Nuncium
  module WebServices
    module DmInfo
      class EraseMessage < ::Nuncium::WebServices::DmInfo::Request
        ATTRS = %i[dmID dmIncoming].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].EraseMessage do
            values(xml)
          end
        end
      end
    end
  end
end
