require 'spec_helper'

describe Belugas::Php::Parser::Database do

  describe "#name" do
    context "With a specified name" do
      it "should return driver name" do
        database = Belugas::Php::Parser::Database.new("spec/support/database_config_2.php")
        expect(database.name).to eq("mysql")
      end
    end

    context "With db_connection name" do
      it "should return driver name" do
        database = Belugas::Php::Parser::Database.new("spec/support/database_config.php")
        expect(database.name).to eq("mysql")
      end
    end

    context "With no name" do
      it "should return return mysql as default" do
        database = Belugas::Php::Parser::Database.new("spec/support/database_config_3.php")
        expect(database.name).to eq("mysql")
      end
    end
  end

  describe "#version" do
    it "should return an empty string" do
      database = Belugas::Php::Parser::Database.new("spec/support/database_config.php")
      expect(database.version).to eq("")
    end
  end

  describe "#description" do
    it "should return an empty string" do 
      database = Belugas::Php::Parser::Database.new("spec/support/database_config.php")
      expect(database.description).to eq("The application uses MYSQL")
    end
  end

  describe "#categories" do
    it "should return Database" do 
      database = Belugas::Php::Parser::Database.new("spec/support/database_config.php")
      expect(database.categories).to eq(["Database"])
    end
  end

  describe "#type" do
    it "should return feature" do
      database = Belugas::Php::Parser::Database.new("spec/support/database_config.php")
      expect(database.type).to eq("feature")
    end
  end
end
