module Nuncium
  class DataBox
    def self.check(options = {})
      ::Nuncium::WebServices::DbSearch::CheckDataBox
        .call(options.merge(dbID: ::Nuncium.configuration.data_box))
    end

    def self.find_by(options = {})
      ::Nuncium::WebServices::DbSearch::FindDataBox
        .call(options)
    end

    def self.owner_info
      ::Nuncium::WebServices::DbAccess::GetOwnerInfoFromLogin.call
    end

    def self.credit_info(options = {})
      ::Nuncium::WebServices::DbSearch::DataBoxCreditInfo
        .call(options.merge(dbID: ::Nuncium.configuration.data_box))
    end

    def self.received(options = {})
      Nuncium::WebServices::DmInfo::GetListOfReceivedMessages
        .call(options)
    end

    def self.sent(options = {})
      Nuncium::WebServices::DmInfo::GetListOfSentMessages
        .call(options)
    end

    def self.state_changes(options = {})
      Nuncium::WebServices::DmInfo::GetMessageStateChanges
        .call(options)
    end

    def self.ping
      Nuncium::WebServices::DmOperations::Ping.call
    end
  end
end
