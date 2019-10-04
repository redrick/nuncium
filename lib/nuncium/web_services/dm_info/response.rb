module Nuncium
  module WebServices
    module DmInfo
      class Response < ::Nuncium::Response
        def initialize(response)
          super
          @status = ::Nuncium::Responses::Dm::Status.new(parsed_body)
          @body = ::Nuncium::Responses::Dm::Body.new(parsed_body)
        end
      end
    end
  end
end
