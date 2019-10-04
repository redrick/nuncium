module Nuncium
  module WebServices
    module DbSearch
      class GetDataBoxActivityStatus < ::Nuncium::WebServices::DbSearch::Request
        ATTRS = %i[dbID baFrom baTo].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].GetDataBoxActivityStatus do
            values(xml)
          end
        end
      end
    end
  end
end
