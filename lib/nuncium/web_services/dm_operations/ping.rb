module Nuncium
  module WebServices
    module DmOperations
      class Ping < ::Nuncium::WebServices::DmOperations::Request
        ATTRS = [].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].DummyOperation {}
        end
      end
    end
  end
end
