require 'spec_helper'

describe Belugas::Php::Feature::Builder do
  describe '#attributes' do
    context 'When receives a composer' do
      it 'should return attributes' do
        composer = Belugas::Php::Parser::Composer.new('spec/support/composer.json')
        builder = Belugas::Php::Feature::Builder.new(composer)
        expect(builder.attributes).to eq('type' => 'feature',
                                         'name' => 'PHP',
                                         'version' => '5.6.4',
                                         'description' => 'The application uses php',
                                         'content' => '',
                                         'categories' => ['Language'],
                                         'cue_locations' => [''],
                                         'engines' => ['belugas', 'belugas-php'])
      end
    end

    context 'When receives a database' do
      it 'should return attributes' do
        database = Belugas::Php::Parser::Database.new('spec/support/database_config.php')
        builder = Belugas::Php::Feature::Builder.new(database)
        expect(builder.attributes).to eq('type' => 'feature',
                                         'name' => 'postgresql',
                                         'version' => '9.6',
                                         'description' => 'The application uses postgresql',
                                         'content' => '',
                                         'categories' => ['Database'],
                                         'cue_locations' => [''],
                                         'engines' => ['belugas', 'belugas-php'])
      end
    end

    context 'When receives a framework' do
      it 'should return attributes' do
        framework = Belugas::Php::Parser::Framework.new('spec/support/composer.json')
        builder = Belugas::Php::Feature::Builder.new(framework)
        expect(builder.attributes).to eq('type' => 'feature',
                                         'name' => 'laravel',
                                         'version' => '5.3',
                                         'description' => 'The application uses laravel',
                                         'content' => '',
                                         'categories' => ['Framework'],
                                         'cue_locations' => [''],
                                         'engines' => ['belugas', 'belugas-php'])
      end
    end
  end
end
