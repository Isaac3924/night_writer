require 'spec_helper'

RSpec.describe BrailleToEnglish do
  let(:translator) { BrailleToEnglish.new("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...") }

  let(:translator_single) { BrailleToEnglish.new("0.\n.0\n00") }
  
  describe 'Iteration 3' do
    describe '#initialize' do
      it 'exists' do
        expect(translator_single).to be_a(BrailleToEnglish)
        expect(translator).to be_a(BrailleToEnglish)
      end

      it 'has character attribute' do
        expect(translator_single.message).to be_a(String)
        expect(translator_single.message).to eq("0.\n.0\n00")

        expect(translator.message).to be_a(String)
        expect(translator.message).to eq("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...")
      end
    end

    describe '#translate' do
      it 'can change a single braille letter' do
        expect(translator_single.translate).to eq("z")
      end

      xit 'can change multiple braille letters' do
        expect(translator.translate).to eq("hello world")
      end
    end
  end
end