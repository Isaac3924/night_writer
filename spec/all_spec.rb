require 'spec_helper'

RSpec.describe NightWriterClass do
  let(:night_writer) { 
    file_name1 = 'message.txt'

    NightWriterClass.from_terminal(file_name1) 
  }

  let(:false_writer) { 
    file_name1 = 'mess.txt'

    NightWriterClass.from_terminal(file_name1) 
  }
  
  describe 'Iteration 1' do
    describe '#initialize' do

      it 'exists' do
        expect(night_writer).to be_a(NightWriterClass)
      end

      it 'has attributes' do
        expect(night_writer.handle).to be_a(File)
        expect(night_writer.incoming_text).to be_a(String)
        expect(night_writer.incoming_text).to eq("hello world")
        expect(night_writer.old_file_characters).to eq(11)
        expect(night_writer.outgoing_text).to be_a(String)
        expect(night_writer.outgoing_text).to eq("")
      end
    end

    describe '#change_text' do
      it 'can change the text' do
        night_writer.change_text

        expect(night_writer.outgoing_text).to eq("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n")
      end
    end

    describe '#make_file' do
      it 'can change the text' do
        night_writer.change_text

        expect(night_writer.make_file("changed.txt")).to eq( print("Created 'changed.txt' from 'message.txt' which had 17 characters.") )
      end
    end

    describe 'Bad file' do
      it 'exists' do
        expect(false_writer).to eq( print("The first file is not in the directory. Please input a file that is.") )
      end
    end
  end
end

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

RSpec.describe NightReaderClass do
  let(:night_reader) { 
    file_name1 = 'braille.txt'

    NightReaderClass.from_terminal(file_name1) 
  }

  let(:false_reader) { 
    file_name1 = 'mess.txt'

    NightReaderClass.from_terminal(file_name1) 
  }
  
  describe 'Iteration 3' do
    describe '#initialize' do

      it 'exists' do
        expect(night_reader).to be_a(NightReaderClass)
      end

      it 'has attributes' do
        expect(night_reader.handle).to be_a(File)
        expect(night_reader.incoming_text).to be_a(String)
        expect(night_reader.incoming_text).to eq("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n")
        expect(night_reader.new_file_characters).to eq(0)
        expect(night_reader.outgoing_text).to be_a(String)
        expect(night_reader.outgoing_text).to eq("")
      end
    end

    describe '#change_text' do
      it 'can change the text' do
        night_reader.change_text

        expect(night_reader.outgoing_text).to eq("hello world")
      end
    end

    describe '#make_file' do
      it 'can change the text' do
        night_reader.change_text

        expect(night_reader.make_file("original_message.txt")).to eq( print("Created 'original_message.txt' containing 11 characters, from 'braille.txt'.") )
      end
    end

    describe 'Bad file' do
      it 'exists' do
        expect(false_reader).to eq( print("The first file is not in the directory. Please input a file that is.") )
      end
    end
  end
end

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