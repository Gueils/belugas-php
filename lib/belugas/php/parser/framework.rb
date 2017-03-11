require 'belugas/php/parser/framework_data'

module Belugas
  module Php
    module Parser
      class Framework < Base
        
        def name
          data.name
        end

        def version
          data.version
        end

        def categories
          ["Framework"]
        end

        private

        def json_content
          JSON.parse(content)
        end

        def data
          @data ||= Belugas::Php::Parser::FrameworkData.new(json_content)
        end

      end
    end
  end
end
