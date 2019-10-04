module Nuncium
  module Responses
    module Db
      class Status < ::Nuncium::Responses::Status
        private

        def namespace
          'db'
        end
      end
    end
  end
end
