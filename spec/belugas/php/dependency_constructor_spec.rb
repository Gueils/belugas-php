require 'spec_helper'

describe Belugas::Php::DependencyConstructor do
  describe '#dependencies' do
    context 'Without database path' do
      it 'should return only composer & framework dependencies' do
        dependency_constructor = Belugas::Php::DependencyConstructor.new('spec/support/composer.json', '')
        expect(dependency_constructor.dependencies.length).to eq(2)
      end
    end

    context 'With a database path' do
      it 'should return all dependencies' do
        dependency_constructor = Belugas::Php::DependencyConstructor.new('spec/support/composer.json', 'spec/support/database_config.php')
        expect(dependency_constructor.dependencies.length).to eq(3)
      end
    end

    context "With an invalid framework" do
      it "should not return the framework" do 
        dependency_constructor = Belugas::Php::DependencyConstructor.new('spec/support/composer_v10.json', 'spec/support/database_config.php')
        expect(dependency_constructor.dependencies.length).to eq(2)
      end
    end
  end
end
