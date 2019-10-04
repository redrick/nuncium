module Nuncium
  module Responses
    module Messages
      class Event < ::Nuncium::Response
        attr_accessor :dmEventTime, :dmEventDescr

        def initialize(hash)
          @dmEventTime = hash['dmEventTime']
          @dmEventDescr = hash['dmEventDescr']
        end
      end
    end
  end
end
