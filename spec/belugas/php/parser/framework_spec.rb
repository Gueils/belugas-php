require 'spec_helper'

describe Belugas::Php::Parser::Framework do

  describe "#name" do
    context "With a supported framework" do
      it "should return framework name" do
        framework = Belugas::Php::Parser::Framework.new("spec/support/composer.json") 
        expect(framework.name).to eq("laravel")
      end
    end

    context "With a unsupported framework" do
      it "should return non-supported" do
        framework = Belugas::Php::Parser::Framework.new("spec/support/composer_v4.json")
        expect(framework.name).to eq("non-supported")
      end
    end
  end

  describe "#version" do
    context "With a given version" do
      it "should return the version" do
        framework = Belugas::Php::Parser::Framework.new("spec/support/composer.json") 

        expect(framework.version).to eq("5.3")
      end
    end

    context "With no given version" do
      it "should return an empty string" do
        framework = Belugas::Php::Parser::Framework.new("spec/support/composer_v4.json")

        expect(framework.version).to eq("")
      end
    end
  end

end
