module Nuncium
  module WebServices
    module DmOperations
      class ResignIsdsDocument < ::Nuncium::WebServices::DmOperations::Request
        ATTRS = [:dmDoc].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].Re - signISDSDocument do
            values(xml)
          end
        end
      end
    end
  end
end
