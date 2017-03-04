module Belugas
  module Php
    module Parser
      class Composer
        FALLBACK_PHP_VERSION = "5.6.30"
        VERSION_REGEX = /[^~><=>==><](\d*?)[^~><=>==><]*/

        attr_reader :content

        def initialize(path)
          @content = File.read(path)
        end

        def php_version
          json_bad_formatting_exception {
            value = json_content.fetch("require", {}).fetch("php", FALLBACK_PHP_VERSION)
            value.match(VERSION_REGEX).to_s
          }
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
