module Nuncium
  module WebServices
    module DbSearch
      class Request < ::Nuncium::Request
        def response_wrapper
          ::Nuncium::WebServices::DbSearch::Response
        end

        def api_url
          '/DS/df'
        end

        def xml_url
          "https://isds.#{Nuncium.configuration.xml_url}/v20"
        end
      end
    end
  end
end
