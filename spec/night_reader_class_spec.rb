require 'spec_helper'

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
        expect(night_reader.file_characters).to eq(0)
        expect(night_reader.outgoing_text).to be_a(String)
        expect(night_reader.outgoing_text).to eq("")
      end
    end

    describe '#change_text_reader' do
      it 'can change the text' do
        night_reader.change_text_reader

        expect(night_reader.outgoing_text).to eq("hello world")
      end
    end

    describe '#make_file' do
      it 'can create a file' do
        night_reader.change_text_reader
        night_reader.make_file("original_message.txt")

        expect(File.exists?("original_message.txt")).to eq(true)
        expect(night_reader.writer).to be_a(File)
      end

      it 'has a file with the correct contents' do
        night_reader.change_text_reader
        night_reader.make_file("original_message.txt")
        handle = File.open("original_message.txt", "r")

        expect(handle.read).to be_a(String)
      end
    end

    describe '#file_statement' do
      it 'can show the stats of the files via a string' do
        night_reader.change_text_reader
        night_reader.make_file("original_message.txt")

        expect(night_reader.file_statement).to eq ("Created 'original_message.txt' containing 11 characters, from 'braille.txt'.")
      end
    end

    describe 'Bad file' do
      it 'exists' do
        expect(false_reader).to eq( print("The first file is not in the directory. Please input a file that is.") )
      end
    end
  end
end