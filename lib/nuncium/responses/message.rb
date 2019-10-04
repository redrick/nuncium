module Nuncium
  module Responses
    class Message < ::Nuncium::Response
      def initialize(response)
        super
      end

      def message
        ::Nuncium::DataMessage.new(message_hash)
      end

      private

      def message_hash
        hash = parsed_body['dmReturnedMessage']
        hash['dmDm'].delete('xmlns:p')
        hash
      end
    end
  end
end
