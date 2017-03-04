
require 'spec_helper'

describe Belugas::Php::Parser::Composer do

  describe "#name" do
    it "should return PHP" do
      composer = Belugas::Php::Parser::Composer.new("spec/support/composer.json") 
      expect(composer.name).to eq("php")
    end 
  end

  describe "#version" do
    context "With bad formatting json" do
      it "should return fallback php version" do
        composer = Belugas::Php::Parser::Composer.new("spec/support/composer_v3.json")
        expect(composer.version).to eq(Belugas::Php::Parser::Composer::FALLBACK_PHP_VERSION)
      end
    end

    context "When a version is given" do
      it "should return the version" do
        composer = Belugas::Php::Parser::Composer.new("spec/support/composer.json")
        expect(composer.version).to eq("5.6.4")
      end
    end

    context "When a version is not given" do
      it "should return fallback php version" do
        composer = Belugas::Php::Parser::Composer.new("spec/support/composer_v2.json")
        expect(composer.version).to eq(Belugas::Php::Parser::Composer::FALLBACK_PHP_VERSION)
      end
    end
  end

  describe "#description" do
    it "should return an empty string" do
      composer = Belugas::Php::Parser::Composer.new("spec/support/composer.json")
      expect(composer.description).to eq("The application uses PHP")
    end
  end

  describe "#categories" do
    it "should return Language" do
      composer = Belugas::Php::Parser::Composer.new("spec/support/composer.json")
      expect(composer.categories).to eq(["Language"])
    end
  end

  describe "#type" do
    it "should return feature" do
      composer = Belugas::Php::Parser::Composer.new("spec/support/composer.json")
      expect(composer.type).to eq("feature")
    end
  end

end
