require 'pry'
module Belugas
  module Php
    module Parser
      class FrameworkData
        FRAMEWORKS = { 
          "laravel/framework" => "laravel",
          "codeigniter/framework" => "codeigniter",
          "yiisoft/yii" => "yii",
          "zend-framework/zend-mvc" => "zend",
          "cakephp/cakephp" => "cakephp",
          "non-supported" => "non-supported"
        }.freeze
        VERSION_REGEX = /[^~><=>==><](\d*?)[^~><=>==><]*/

        def initialize requirements
          @requirements = requirements
          @element = {}
          extract
        end

        def extract
          @requirements.each do |key, value|
            @element = { name: key, version: value } if FRAMEWORKS.include?(key)
          end
        end

        def name
          FRAMEWORKS.fetch(@element[:name], "non-supported")
        end

        def version
          regex_version.zero? ? "" : regex_version.to_s
        end

        def regex_version
          @element.fetch(:version, "").match(VERSION_REGEX).to_s.to_f
        end
      end
    end
  end
end
