require 'spec_helper'

describe Belugas::Php::Parser::Framework do
  describe '#name' do
    context 'With a supported framework' do
      it 'should return framework name' do
        framework = Belugas::Php::Parser::Framework.new('spec/support/composer.json')
        expect(framework.name).to eq('laravel')
      end
    end

    context 'With a unsupported framework' do
      it 'should return no available' do
        framework = Belugas::Php::Parser::Framework.new('spec/support/composer_v4.json')
        expect(framework.name).to eq('N/A')
      end
    end
  end

  describe '#version' do
    context 'With a given version' do
      it 'should return the version' do
        framework = Belugas::Php::Parser::Framework.new('spec/support/composer.json')

        expect(framework.version).to eq('5.3')
      end
    end

    context 'With no given version' do
      it "should return 5.4.2 for laravel" do
        framework = Belugas::Php::Parser::Framework.new('spec/support/composer_v5.json')
        expect(framework.version).to eq('5.4.2')
      end

      it "should return 2.4 for zend" do
        framework = Belugas::Php::Parser::Framework.new('spec/support/composer_v6.json')
        expect(framework.version).to eq('2.4')
      end

      it "should return 3.1.4 for codeigniter" do
        framework = Belugas::Php::Parser::Framework.new('spec/support/composer_v7.json')
        expect(framework.version).to eq('3.1.4')
      end

      it "should return 3.4.7 for cakephp" do
        framework = Belugas::Php::Parser::Framework.new('spec/support/composer_v8.json')
        expect(framework.version).to eq('3.4.7')
      end

      it "should return 2.0.11 for yii" do
        framework = Belugas::Php::Parser::Framework.new('spec/support/composer_v9.json')
        expect(framework.version).to eq('2.0.11')
      end
    end

    context "When the version is not listed on required fields" do
      it "should return the default" do
        framework = Belugas::Php::Parser::Framework.new('spec/support/composer_v11.json')
        expect(framework.version).to eq('3.1.4')
      end
    end
  end

  describe "#available?" do
    it "should return true if it's a supported framework" do
      framework = Belugas::Php::Parser::Framework.new('spec/support/composer.json')

      expect(framework.available?).to be_truthy
    end

    it "should return false otherwise" do
      framework = Belugas::Php::Parser::Framework.new('spec/support/composer_v4.json')

      expect(framework.available?).to be_falsy
    end
  end
end
