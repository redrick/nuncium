module Nuncium
  module WebServices
    module DmInfo
      class GetMessageStateChanges < ::Nuncium::WebServices::DmInfo::Request
        ATTRS = %i[dmFromTime dmToTime].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].GetMessageStateChanges do
            values(xml)
          end
        end
      end
    end
  end
end
