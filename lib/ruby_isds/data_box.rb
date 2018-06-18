module RubyIsds
  class DataBox
    def self.check(options = {})
      ::RubyIsds::WebServices::DbSearch::CheckDataBox
        .call(options.merge(dbID: ::RubyIsds.configuration.data_box))
    end

    def self.find_by(options = {})
      ::RubyIsds::WebServices::DbSearch::FindDataBox
        .call(options)
    end

    def self.credit_info(options = {})
      ::RubyIsds::WebServices::DbSearch::DataBoxCreditInfo
        .call(options.merge(dbID: ::RubyIsds.configuration.data_box))
    end

    def self.received(options = {})
      RubyIsds::WebServices::DmInfo::GetListOfReceivedMessages
        .call(options)
    end

    def self.sent(options = {})
      RubyIsds::WebServices::DmInfo::GetListOfSentMessages
        .call(options)
    end
  end
end
