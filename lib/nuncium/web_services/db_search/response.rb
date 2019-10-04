module Nuncium
  module WebServices
    module DbSearch
      class Response < ::Nuncium::Response
        def initialize(response)
          super
          @status = ::Nuncium::Responses::Db::Status.new(parsed_body)
          @body = ::Nuncium::Responses::Db::Body.new(parsed_body)
        end
      end
    end
  end
end
