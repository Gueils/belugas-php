module Belugas
  module Php
    module FallbackVersions
      class Base
        VERSIONS = {
          'php' => '5.6.30',
          'pg' => '9.6',
          'pgsql' => '9.6',
          'postgresql' => '9.6',
          'mysql' => '5.7',
          'sqlite' => '3.19',
          'laravel' => '5.4.2',
          'zend' => '2.4',
          'code_igniter' => '3.1.4',
          'cake_php' => '3.4.7',
          'yii' => '2.0.11'
        }.freeze
      end
    end
  end
end

