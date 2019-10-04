RSpec.describe Nuncium::DataBox do
  describe '.check' do
    it 'correctly call underlying web service' do
      expect(::Nuncium::WebServices::DbSearch::CheckDataBox)
        .to receive(:call).with(dbID: ::Nuncium.configuration.data_box)

      Nuncium::DataBox.check
    end
  end

  describe '.credit_info' do
    it 'correctly call underlying web service' do
      expect(::Nuncium::WebServices::DbSearch::DataBoxCreditInfo)
        .to receive(:call).with(dbID: ::Nuncium.configuration.data_box)

      Nuncium::DataBox.credit_info
    end
  end

  describe '.find_by' do
    it 'correctly call underlying web service' do
      expect(::Nuncium::WebServices::DbSearch::FindDataBox)
        .to receive(:call).with(dbType: 'FO', pnLastName: 'Antaš')

      Nuncium::DataBox.find_by(dbType: 'FO', pnLastName: 'Antaš')
    end
  end

  describe '.received' do
    it 'correctly call underlying web service' do
      expect(::Nuncium::WebServices::DmInfo::GetListOfReceivedMessages)
        .to receive(:call)

      Nuncium::DataBox.received
    end
  end

  describe '.sent' do
    it 'correctly call underlying web service' do
      expect(::Nuncium::WebServices::DmInfo::GetListOfSentMessages)
        .to receive(:call)

      Nuncium::DataBox.sent
    end
  end

  describe '.state_changes' do
    it 'correctly call underlying web service' do
      expect(::Nuncium::WebServices::DmInfo::GetMessageStateChanges)
        .to receive(:call)

      Nuncium::DataBox.state_changes
    end
  end
end
