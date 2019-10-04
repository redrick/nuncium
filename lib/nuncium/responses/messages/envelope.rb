module Nuncium
  module Responses
    module Messages
      class Envelope < ::Nuncium::Response
        def initialize(response)
          super
        end

        def message
          ::Nuncium::DataMessage.new(message_hash)
        end

        private

        def message_hash
          hash = parsed_body['dmReturnedMessageEnvelope']
          hash['dmDm'].delete('xmlns:p')
          hash
        end
      end
    end
  end
end
