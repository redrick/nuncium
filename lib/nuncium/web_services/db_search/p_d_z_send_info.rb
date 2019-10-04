module Nuncium
  module WebServices
    module DbSearch
      class PDZSendInfo < ::Nuncium::WebServices::DbSearch::Request
        ATTRS = %i[dbId PDZType].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].PDZSendInfo do
            values(xml)
          end
        end
      end
    end
  end
end
