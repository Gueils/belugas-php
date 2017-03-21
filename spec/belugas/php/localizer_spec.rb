require 'spec_helper'

describe Belugas::Php::Localizer do
  describe '#composer_path' do
    it 'should return composer.json path' do
      localizer = Belugas::Php::Localizer.new('/code')
      expect(localizer.composer_path).to eq('/code/composer.json')
    end
  end

  describe '#database_path' do
    context 'With no database file' do
      it 'should return empty strings' do
        localizer = Belugas::Php::Localizer.new("#{Dir.pwd}/spec/support/code_test/")
        expect(localizer.database_path).to eq('')
      end
    end

    context 'With multiple files' do
      it 'should return the first file' do
        localizer = Belugas::Php::Localizer.new("#{Dir.pwd}/spec/support/code_test_2/")
        file_path = %r{code_test_2\/config\/database.php}
        expect(localizer.database_path).to match(file_path)
      end
    end

    context 'With just one file' do
      it 'should return the file' do
        localizer = Belugas::Php::Localizer.new("#{Dir.pwd}/spec/support/code_test_3/")
        file_path = %r{code_test_3\/config\/database.php}
        expect(localizer.database_path).to match file_path
      end
    end
  end
end
