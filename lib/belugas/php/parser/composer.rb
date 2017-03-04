module Belugas
  module Php
    module Parser
      class Composer < Base
        FALLBACK_PHP_VERSION = "5.6.30"
        VERSION_REGEX = /[^~><=>==><](\d*?)[^~><=>==><]*/

        def name
          "php"
        end

        def version
          json_bad_formatting_exception {
            value = json_content.fetch("require", {}).fetch("php", FALLBACK_PHP_VERSION)
            value.match(VERSION_REGEX).to_s
          }
        end

        def categories
          ["Language"]
        end

        private

        def json_content
          JSON.parse(content)
        end

        def json_bad_formatting_exception
          begin
            yield
          rescue JSON::ParserError
            FALLBACK_PHP_VERSION 
          end
        end

      end
    end
  end
end
