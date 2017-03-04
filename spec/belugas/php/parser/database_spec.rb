require 'spec_helper'

describe Belugas::Php::Parser::Database do

  before(:each) do
    @database = Belugas::Php::Parser::Database.new("spec/support/database_config.php")
  end


  describe "#name" do
    it "should return driver name" do
      expect(@database.name).to eq("mysql")
    end 
  end

  describe "#version" do
    it "should return an empty string" do
      expect(@database.version).to eq("")
    end
  end

  describe "#description" do
    it "should return an empty string" do 
      expect(@database.description).to eq("")
    end
  end

  describe "#categories" do
    it "should return Database" do 
      expect(@database.categories).to eq(["Database"])
    end
  end

  describe "#type" do
    it "should return feature" do
      expect(@database.type).to eq("feature")
    end
  end
end
