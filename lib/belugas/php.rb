require "thor"
require "json"
require 'belugas/php/dispatcher'

module Belugas
  module Php
    class Sonar < Thor
      package_name "belugas-php"

      desc "analyze --composer-path=/app/code", "PHP feature detection JSON"
      method_option "composer-path", type: :string, default: "/code/composer.json", required: false, aliases: "-p"
      method_option "database-path", type: :string, default: "/code/config/database.php", required: false, alises: "-d"

      def analyze
        Belugas::Php::Dispatcher.new(options["composer-path"], options["database-path"]).render
      end
    end
  end
end

require "belugas/php/version"
