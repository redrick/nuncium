require 'net/http'
require 'net/https'
require 'base64'
require 'nokogiri'
require 'active_support/core_ext/hash'

require 'nuncium/utils/errors'

require 'nuncium/version'
require 'nuncium/configuration'
require 'nuncium/request'
require 'nuncium/response'

require 'nuncium/data_box'
require 'nuncium/data_message'

require 'nuncium/responses/body'
require 'nuncium/responses/status'
require 'nuncium/responses/db/status'
require 'nuncium/responses/dm/status'
require 'nuncium/responses/dm/body'
require 'nuncium/responses/db/body'
require 'nuncium/responses/message'
require 'nuncium/responses/messages/event'
require 'nuncium/responses/messages/envelope'
require 'nuncium/responses/messages/attachment'
require 'nuncium/responses/messages/collection'
require 'nuncium/responses/messages/delivery_info'

require 'nuncium/web_services/db_search/response'
require 'nuncium/web_services/db_search/request'
require 'nuncium/web_services/db_search/find_data_box'
require 'nuncium/web_services/db_search/d_t_info'
require 'nuncium/web_services/db_search/get_data_box_activity_status'
require 'nuncium/web_services/db_search/check_data_box'
require 'nuncium/web_services/db_search/data_box_credit_info'
require 'nuncium/web_services/db_search/find_personal_data_box'
require 'nuncium/web_services/db_search/get_data_box_list'
require 'nuncium/web_services/db_search/isds_search_2'
require 'nuncium/web_services/db_search/p_d_z_info'
require 'nuncium/web_services/db_search/p_d_z_send_info'

require 'nuncium/web_services/db_access/change_isds_password'
require 'nuncium/web_services/db_access/get_owner_info_from_login'

require 'nuncium/web_services/dm_info/request'
require 'nuncium/web_services/dm_info/response'
require 'nuncium/web_services/dm_info/confirm_delivery'
require 'nuncium/web_services/dm_info/erase_message'
require 'nuncium/web_services/dm_info/get_delivery_info'
require 'nuncium/web_services/dm_info/get_list_of_received_messages'
require 'nuncium/web_services/dm_info/get_list_of_sent_messages'
require 'nuncium/web_services/dm_info/get_message_author'
require 'nuncium/web_services/dm_info/get_message_state_changes'
require 'nuncium/web_services/dm_info/get_signed_delivery_info'
require 'nuncium/web_services/dm_info/mark_message_as_downloaded'
require 'nuncium/web_services/dm_info/message_envelope_download'
require 'nuncium/web_services/dm_info/verify_message'

require 'nuncium/web_services/dm_operations/request'
require 'nuncium/web_services/dm_operations/response'
require 'nuncium/web_services/dm_operations/authenticate_message'
require 'nuncium/web_services/dm_operations/create_message'
require 'nuncium/web_services/dm_operations/create_multiple_messages'
require 'nuncium/web_services/dm_operations/message_download'
require 'nuncium/web_services/dm_operations/ping'
require 'nuncium/web_services/dm_operations/resign_isds_document'
require 'nuncium/web_services/dm_operations/signed_message_download'
require 'nuncium/web_services/dm_operations/signed_sent_message_download'

module Nuncium
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.ping
    ::Nuncium::WebServices::DmOperations::Ping.new.call
  end
end
