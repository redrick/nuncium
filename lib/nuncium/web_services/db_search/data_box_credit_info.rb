module Nuncium
  module WebServices
    module DbSearch
      class DataBoxCreditInfo < ::Nuncium::WebServices::DbSearch::Request
        ATTRS = %i[dbID ciFromDate ciTodate].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].DataBoxCreditInfo do
            values(xml)
          end
        end
      end
    end
  end
end
