
require 'spec_helper'

describe Belugas::Php::Parser::Composer do

  describe "#php_version" do

    context "With bad formatting json" do
      it "should return fallback php version" do
        composer = Belugas::Php::Parser::Composer.new("spec/support/composer_v3.json")
        expect(composer.php_version).to eq(Belugas::Php::Parser::Composer::FALLBACK_PHP_VERSION)
      end
    end

    context "When a version is given" do
      it "should return the version" do
        composer = Belugas::Php::Parser::Composer.new("spec/support/composer.json")
        expect(composer.php_version).to eq("5.6.4")
      end
    end

    context "When a version is not given" do

      it "should return fallback php version" do
        composer = Belugas::Php::Parser::Composer.new("spec/support/composer_v2.json")
        expect(composer.php_version).to eq(Belugas::Php::Parser::Composer::FALLBACK_PHP_VERSION)
      end
    end
  end
end
