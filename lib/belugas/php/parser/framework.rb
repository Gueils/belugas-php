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

        def requirements
          json_content.fetch("require", {})
        end

        def json_content
          JSON.parse(content)
        end

        def data
          @data ||= Belugas::Php::Parser::FrameworkData.new(requirements)
        end

      end
    end
  end
end
