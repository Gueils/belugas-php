require 'belugas/php/fallback_versions/base'
require 'belugas/php/parser/framework_data'
require 'belugas/php/standard_names/base'
require 'belugas/php'

module Belugas
  module Php
    module Parser
      class Framework < Base
        NOT_AVAILABLE = "N/A".freeze

        def name
          Belugas::Php::StandardNames::Base::NAMES.fetch(data.name, NOT_AVAILABLE)
        end

        def version
          return 0.0 unless available?
          if data.version.zero?
            Belugas::Php::FallbackVersions::Base::VERSIONS[name]
          else
            data.version.to_s
          end
        end

        def categories
          ['Framework']
        end

        def available?
          name != NOT_AVAILABLE
        end

        private

        def json_content
          JSON.parse(content)
        end

        def data
          @data ||= Belugas::Php::Parser::FrameworkData.new(json_content)
        end
      end
    end
  end
end
