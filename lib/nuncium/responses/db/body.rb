module Nuncium
  module Responses
    module Db
      class Body < ::Nuncium::Responses::Body
        REMOVED_KEYS = %w[xmlns:p xmlns:xsi dbStatus].freeze
      end
    end
  end
end
