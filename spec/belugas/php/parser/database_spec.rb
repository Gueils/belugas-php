require 'spec_helper'

describe Belugas::Php::Parser::Database do
  describe '#name' do
    context 'With a specified name' do
      it 'should return driver name' do
        database = Belugas::Php::Parser::Database.new('spec/support/database_config_2.php')
        expect(database.name).to eq('mysql')
      end
    end

    context 'With db connection name' do
      it 'should return driver name' do
        database = Belugas::Php::Parser::Database.new('spec/support/database_config.php')
        expect(database.name).to eq('postgresql')
      end
    end

    context 'With no name' do
      it 'should return mysql as default' do
        database = Belugas::Php::Parser::Database.new('spec/support/database_config_3.php')
        expect(database.name).to eq('mysql')
      end
    end

    context 'With code igniter app' do
      it 'should return mysql' do
        database = Belugas::Php::Parser::Database.new('spec/support/database_config_4.php')
        expect(database.name).to eq('postgresql')
      end
    end
  end

  describe '#version' do
    context "With mysql" do
      it "should return 5.7" do
        database = Belugas::Php::Parser::Database.new('spec/support/database_config_2.php')
        expect(database.version).to eq('5.7')
      end
    end

    context "With postgresql" do
      it "should return 9.6" do
        database = Belugas::Php::Parser::Database.new('spec/support/database_config.php')
        expect(database.version).to eq('9.6')
      end
    end

    context "With sqlite" do
      it "should return 3.19" do
        database = Belugas::Php::Parser::Database.new('spec/support/database_config_5.php')
        expect(database.version).to eq('3.19')

      end
    end
  end

  describe '#description' do
    it 'should return an empty string' do
      database = Belugas::Php::Parser::Database.new('spec/support/database_config.php')
      expect(database.description).to eq('The application uses postgresql')
    end
  end

  describe '#categories' do
    it 'should return Database' do
      database = Belugas::Php::Parser::Database.new('spec/support/database_config.php')
      expect(database.categories).to eq(['Database'])
    end
  end

  describe '#type' do
    it 'should return feature' do
      database = Belugas::Php::Parser::Database.new('spec/support/database_config.php')
      expect(database.type).to eq('feature')
    end
  end
end
