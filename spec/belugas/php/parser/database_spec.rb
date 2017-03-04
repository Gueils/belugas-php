
require 'spec_helper'

describe Belugas::Php::Parser::Database do

  describe "#name" do
    it "should return driver name" do
      database = Belugas::Php::Parser::Database.new("spec/support/database_config.php")
      expect(database.name).to eq("mysql")
    end 
  end
end
