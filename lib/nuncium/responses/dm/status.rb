module Nuncium
  module Responses
    module Dm
      class Status < ::Nuncium::Responses::Status
        private

        def namespace
          'dm'
        end
      end
    end
  end
end
