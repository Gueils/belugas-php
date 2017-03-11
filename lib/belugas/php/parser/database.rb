module Belugas
  module Php
    module Parser
      class Database < Base
        DATABASES = %w(mysql pgsql sqlite sqlsrv)
        DEFAULT_MATCHES = /'default'.{3,}/
        DEFAULT = "'default'"

        def name
          default_matches.each do |text|
            DATABASES.each do |database|
              return database if text.include?(database)
            end
          end
          "mysql"
        end

        def categories
          ["Database"]
        end

        private

        def default_matches
          content.gsub(DEFAULT_MATCHES).to_a
        end

      end
    end
  end
end
