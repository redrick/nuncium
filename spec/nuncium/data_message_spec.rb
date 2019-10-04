RSpec.describe Nuncium::DataMessage do
  describe '.find' do
    it 'correctly call underlying web service' do
      expect(::Nuncium::WebServices::DmOperations::MessageDownload)
        .to receive(:call).with(dmID: '123456789')

      Nuncium::DataMessage.find('123456789')
    end
  end

  context 'with real message' do
    before do
      VCR.use_cassette 'data_box/received' do
        @message = Nuncium::DataBox.received.messages.last
      end
    end

    describe '#author' do
      it 'displays author information' do
        expect(Nuncium::WebServices::DmInfo::GetMessageAuthor)
          .to receive(:call).with(dmID: '6427668')
        @message.author
      end
    end

    describe '#verify' do
      it 'verifies message' do
        expect(Nuncium::WebServices::DmInfo::VerifyMessage)
          .to receive(:call).with(dmID: '6427668')
        @message.verify
      end
    end
  end
end
