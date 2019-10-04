module Nuncium
  module WebServices
    module DmOperations
      class Request < ::Nuncium::Request
        def response_wrapper
          ::Nuncium::WebServices::DmOperations::Response
        end

        def api_url
          '/DS/dz'
        end

        def xml_url
          "https://isds.#{Nuncium.configuration.xml_url}/v20"
        end
      end
    end
  end
end
