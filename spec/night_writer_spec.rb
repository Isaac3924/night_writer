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
        expect(night_writer.incoming_text).to eq("This is a message.")
        expect(night_writer.old_file_characters).to eq(18)
        expect(night_writer.outgoing_text).to be_a(String)
        expect(night_writer.outgoing_text).to eq("")
      end
    end

    describe '#change_text' do
      it 'can change the text' do
        night_writer.change_text

        expect(night_writer.outgoing_text).to eq("THIS IS A MESSAGE.")
      end
    end

    describe '#make_file' do
      it 'can change the text' do
        night_writer.change_text

        expect(night_writer.make_file("changed.txt")).to eq( print("Created 'changed.txt' from 'message.txt' which had 18 characters.") )
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
  
  describe 'Iteration 2' do
    describe '#initialize' do
      it 'exists' do
        expect(translator).to be_a(EnglishToBraille)
      end

      it 'has character attribute' do
        expect(translator.message).to be_a(String)
        expect(translator.message).to eq("hello world hello world hello world hello world hello world hello world hello world hello world ")
      end
    end

    describe '#translate' do
      it 'can change' do
        expect(translator.translate).to eq("0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.\n00.00.0..0..00.0000..0..00.00.0..0..00.0000..0..00.00.0..0..00.0000..0..00.00.0.\n....0.0.0....00.0.0.........0.0.0....00.0.0.........0.0.0....00.0.0.........0.0.\n0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.\n.0..00.0000..0..00.00.0..0..00.0000..0..00.00.0..0..00.0000..0..00.00.0..0..00.0\n0....00.0.0.........0.0.0....00.0.0.........0.0.0....00.0.0.........0.0.0....00.\n0.0.00..0.0.0.0.0....00.0.0.00..\n000..0..00.00.0..0..00.0000..0..\n0.0.........0.0.0....00.0.0.....\n")
      end
    end
  end
end