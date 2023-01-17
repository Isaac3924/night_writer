require 'spec_helper'

RSpec.describe EnglishToBraille do
  let(:translator) { EnglishToBraille.new('hello world hello world hello world hello world hello world hello world hello world hello world ') }

  let(:nil_check) { EnglishToBraille.new('!') }
  
  describe 'Iteration 2' do
    describe '#initialize' do
      it 'exists' do
        expect(translator).to be_a(EnglishToBraille)
        expect(nil_check).to be_a(EnglishToBraille)
      end

      it 'has character attribute' do
        expect(translator.message).to be_a(String)
        expect(translator.message).to eq("hello world hello world hello world hello world hello world hello world hello world hello world ")

        expect(nil_check.message).to be_a(String)
        expect(nil_check.message).to eq("!")
      end
    end

    describe '#translate' do
      it 'can change' do
        expect(translator.translate).to eq("0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.\n00.00.0..0..00.0000..0..00.00.0..0..00.0000..0..00.00.0..0..00.0000..0..00.00.0.\n....0.0.0....00.0.0.........0.0.0....00.0.0.........0.0.0....00.0.0.........0.0.\n0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.\n.0..00.0000..0..00.00.0..0..00.0000..0..00.00.0..0..00.0000..0..00.00.0..0..00.0\n0....00.0.0.........0.0.0....00.0.0.........0.0.0....00.0.0.........0.0.0....00.\n0.0.00..0.0.0.0.0....00.0.0.00..\n000..0..00.00.0..0..00.0000..0..\n0.0.........0.0.0....00.0.0.....\n")
      end

      it 'can change' do
        expect(nil_check.translate).to eq("XX\nXX\nXX\n")
      end
    end
  end
end