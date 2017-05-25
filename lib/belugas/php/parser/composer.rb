module Belugas
  module Php
    module Parser
      class Composer < Base
        FALLBACK_PHP_VERSION = '5.6.30'.freeze
        VERSION_REGEX = /[^~><=>==><](\d*?)[^~><=>==><]*/

        def name
          'PHP'
        end

        def version
          json_bad_formatting_exception do
            value = json_content.fetch('require', {}).fetch('php', FALLBACK_PHP_VERSION)
            value.match(VERSION_REGEX).to_s
          end
        end

        def categories
          ['Language']
        end

        private

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
