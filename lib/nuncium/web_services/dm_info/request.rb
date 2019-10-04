module Nuncium
  module WebServices
    module DmInfo
      class Request < ::Nuncium::Request
        def response_wrapper
          ::Nuncium::WebServices::DmInfo::Response
        end

        def api_url
          '/DS/dx'
        end

        def xml_url
          "https://isds.#{Nuncium.configuration.xml_url}/v20"
        end
      end
    end
  end
end
