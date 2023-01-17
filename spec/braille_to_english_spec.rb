require 'spec_helper'

RSpec.describe BrailleToEnglish do
  let(:translator) { BrailleToEnglish.new("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...") }

  let(:translator_single) { BrailleToEnglish.new("0.\n.0\n00") }

  let(:translator_long) { BrailleToEnglish.new("0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.\n00.00.0..0..00.0000..0..00.00.0..0..00.0000..0..00.00.0..0..00.0000..0..00.00.0.\n....0.0.0....00.0.0.........0.0.0....00.0.0.........0.0.0....00.0.0.........0.0.\n0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.\n.0..00.0000..0..00.00.0..0..00.0000..0..00.00.0..0..00.0000..0..00.00.0..0..00.0\n0....00.0.0.........0.0.0....00.0.0.........0.0.0....00.0.0.........0.0.0....00.\n0.0.00..0.0.0.0.0....00.0.0.00..\n000..0..00.00.0..0..00.0000..0..\n0.0.........0.0.0....00.0.0.....\n") }
  
  describe 'Iteration 3' do
    describe '#initialize' do
      it 'exists' do
        expect(translator_single).to be_a(BrailleToEnglish)
        expect(translator).to be_a(BrailleToEnglish)
        expect(translator_long).to be_a(BrailleToEnglish)
      end

      it 'has character attribute' do
        expect(translator_single.braille_message).to be_a(String)
        expect(translator_single.braille_message).to eq("0.\n.0\n00")

        expect(translator.braille_message).to be_a(String)
        expect(translator.braille_message).to eq("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...")

        expect(translator_long.braille_message).to be_a(String)
        expect(translator_long.braille_message).to eq("0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.\n00.00.0..0..00.0000..0..00.00.0..0..00.0000..0..00.00.0..0..00.0000..0..00.00.0.\n....0.0.0....00.0.0.........0.0.0....00.0.0.........0.0.0....00.0.0.........0.0.\n0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.\n.0..00.0000..0..00.00.0..0..00.0000..0..00.00.0..0..00.0000..0..00.00.0..0..00.0\n0....00.0.0.........0.0.0....00.0.0.........0.0.0....00.0.0.........0.0.0....00.\n0.0.00..0.0.0.0.0....00.0.0.00..\n000..0..00.00.0..0..00.0000..0..\n0.0.........0.0.0....00.0.0.....\n")

        expect(translator.braille_alhpabet).to be_a(Hash)
        expect(translator_single.braille_alhpabet).to be_a(Hash)
        expect(translator_long.braille_alhpabet).to be_a(Hash)
      end
    end

    describe '#translate' do
      it 'can change a single braille letter' do
        expect(translator_single.translate).to eq("z")
      end

      it 'can change multiple braille letters' do
        expect(translator.translate).to eq("hello world")
      end

      it 'can change multiple braille letters on multiple lines' do
        expect(translator_long.translate).to eq("hello world hello world hello world hello world hello world hello world hello world hello world ")
      end
    end
  end
end