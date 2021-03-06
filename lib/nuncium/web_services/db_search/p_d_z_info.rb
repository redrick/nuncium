module Nuncium
  module WebServices
    module DbSearch
      class PDZInfo < ::Nuncium::WebServices::DbSearch::Request
        ATTRS = [:PDZSender].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].PDZInfo do
            values(xml)
          end
        end
      end
    end
  end
end
