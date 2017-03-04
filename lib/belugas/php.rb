require "thor"
require "json"

module Belugas
  module Php
    class Sonar < Thor
      package_name "belugas-php"

      desc "analyze --composer-path=/app/code", "PHP feature detection JSON"
      method_option "composer-path", type: :string, default: "/code/composer.json", required: false, aliases: "-p"

      def analyze
        dispatcher = Belugas::Php::Dispatcher.new(options["composer-path"])
        dispatcher.render
      end
    end
  end
end

require "belugas/php/version"
