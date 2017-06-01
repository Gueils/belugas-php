module Belugas
  module Php
    module Parser
      class Composer < Base
        DIGITS_REGEX = /(\d+[,.]\d+)/
        FALLBACK_PHP_VERSION = '5.6.30'.freeze
        VERSION_REGEX = /[^~><=>==><](\d*?)[^~><=>==><]*/

        def name
          'PHP'
        end

        def version
          json_bad_formatting_exception do
            value = json_content.fetch('require', {}).fetch('php', FALLBACK_PHP_VERSION)
            if range?(value)
              value.match(DIGITS_REGEX)[0].to_s
            else
              value.match(VERSION_REGEX).to_s
            end
          end
        end

        def categories
          ['Language']
        end

        private

        def range? value
          value.include?("||")
        end

        def json_content
          JSON.parse(content)
        end

        def json_bad_formatting_exception
          yield
        rescue JSON::ParserError
          FALLBACK_PHP_VERSION
        end
      end
    end
  end
end
