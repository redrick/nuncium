module Nuncium
  module Responses
    module Dm
      class Body < ::Nuncium::Responses::Body
        REMOVED_KEYS = %w[xmlns:q xmlns:p xmlns:xsi dmStatus].freeze
      end
    end
  end
end
