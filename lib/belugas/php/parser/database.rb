module Belugas
  module Php
    module Parser
      class Database < Base
        DATABASES = %w('mysql' 'pgsql' 'sqlite' 'sqlsrv')
        SINGLE_QUOTES_MATCHES_REGEX = /(?:(?<gq>['])(?<name>[a-zA-Z0-9\-_\.]+)\k<gq>|%q<(?<name>[a-zA-Z0-9\-_\.]+)>)/
        DEFAULT = "'default'"

        def name
          positions.each do |index|
            return database_matches[index].tr("'", "") if DATABASES.include?(database_matches[index])
          end
          "mysql"
        end

        def categories
          ["Database"]
        end

        private

        def database_matches
          @database_matches ||= content.gsub(SINGLE_QUOTES_MATCHES_REGEX).to_a
        end

        def default_position
          database_matches.index(DEFAULT) || 0
        end

        def positions
          (default_position + 1..default_position + 3)
        end
      end
    end
  end
end
