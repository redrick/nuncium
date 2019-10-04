module Nuncium
  module WebServices
    module DmInfo
      class GetListOfSentMessages < ::Nuncium::WebServices::DmInfo::Request
        ATTRS = %i[dmFromTime dmToTime dmSenderOrgUnitNum
                   dmStatusFilter dmOffset dmLimit].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].GetListOfSentMessages do
            values(xml)
          end
        end

        def response_wrapper
          ::Nuncium::Responses::Messages::Collection
        end

        def call_reponse_wrapper(response)
          response_wrapper.new(response)
        end
      end
    end
  end
end
