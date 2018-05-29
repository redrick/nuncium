module RubyIsds
  module WebServices
    module DbSearch
      class PDZInfo < ::RubyIsds::WebServices::DbSearch::Request
        ATTRS = [:PDZSender]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].PDZInfo {
            values(xml)
          }
        end
      end
    end
  end
end
