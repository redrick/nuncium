##
# I don't think this is ever going to work... that is what they provide thou...
#
module Nuncium
  module WebServices
    module DbSearch
      class GetDataBoxList < ::Nuncium::WebServices::DbSearch::Request
        ATTRS = [:dblType].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].GetDataBoxList do
            values(xml)
          end
        end
      end
    end
  end
end
