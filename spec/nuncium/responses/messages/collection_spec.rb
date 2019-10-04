RSpec.describe Nuncium::Responses::Messages::Collection do
  describe '#messages' do
    it 'correctly parses one record (as hash)' do
      response = OpenStruct.new
      response.body = File.read('spec/factories/files/one_message_response.xml')

      expect(Nuncium::DataMessage).to receive(:new).once

      Nuncium::Responses::Messages::Collection.new(response).messages
    end

    it 'correctly parses array of records' do
      response = OpenStruct.new
      response.body = File.read('spec/factories/files/multiple_message_response.xml')

      expect(Nuncium::DataMessage).to receive(:new).exactly(3).times
      Nuncium::Responses::Messages::Collection.new(response).messages
    end
  end
end
