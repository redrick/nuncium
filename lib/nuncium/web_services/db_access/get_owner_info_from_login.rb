module Nuncium
  module WebServices
    module DbAccess
      class GetOwnerInfoFromLogin < ::Nuncium::WebServices::DbSearch::Request
        ATTRS = [].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].GetOwnerInfoFromLogin {}
        end

        def api_url
          '/DS/DsManage'
        end
      end
    end
  end
end
