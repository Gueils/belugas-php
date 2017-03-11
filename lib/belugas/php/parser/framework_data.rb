module Belugas
  module Php
    module Parser
      class FrameworkData
        FRAMEWORKS = %w(laravel cakephp codeigniter zend yii).freeze

        def initialize requirements
          @requirements = requirements
          extract
        end

        def extract
          find_name
          find_version   
        end

        def name
          @name || "non-supported"
        end

        def version
          @version || ""
        end

        private 

        def find_name
          @requirements.each do |key, value|
            FRAMEWORKS.each do |framework|
              @name = framework if @requirements[key].to_s.downcase.include?(framework)
            end
          end
        end

        def find_version
          return unless @name
          require_fields.keys.each do |key|
            @version = extract_version_from_required(key) if key.include?(@name)
          end
        end

        def extract_version_from_required key
          require_fields[key].to_f.to_s
        end

        def require_fields
          @require_fields ||= @requirements.fetch("require", {})
        end
      end
    end
  end
end
