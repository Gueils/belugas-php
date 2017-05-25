require 'belugas/php/fallback_versions/base'
require 'belugas/php/standard_names/base'

module Belugas
  module Php
    module Parser
      class Database < Base
        DATABASES = %w(mysql pgsql sqlite sqlsrv).freeze
        DEFAULT_MATCHES = /'default'.{3,}/
        DEFAULT = "'default'".freeze

        def name
          Belugas::Php::StandardNames::Base::NAMES[database_name]
        end

        def version
          Belugas::Php::FallbackVersions::Base::VERSIONS[name]
        end

        def categories
          ['Database']
        end

        private

        def default_matches
          content.gsub(DEFAULT_MATCHES).to_a
        end

        def database_name
          @database_name ||= find_database_name
        end

        def find_database_name
          default_matches.each do |text|
            DATABASES.each do |database|
              return database if text.include?(database)
            end
          end
          'mysql'
        end

      end
    end
  end
end
