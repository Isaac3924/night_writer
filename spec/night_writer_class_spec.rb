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
        expect(night_writer.file_characters).to eq(0)
        expect(night_writer.outgoing_text).to be_a(String)
        expect(night_writer.outgoing_text).to eq("")
      end
    end

    describe '#change_text_writer' do
      it 'can change the text' do
        night_writer.change_text_writer

        expect(night_writer.outgoing_text).to eq("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n")
      end
    end

    describe '#make_file' do
      it 'can create a file' do
        night_writer.change_text_writer
        night_writer.make_file("braille.txt")

        expect(File.exists?("braille.txt")).to eq(true)
        expect(night_writer.writer).to be_a(File)
      end

      it 'has a file with the correct contents' do
        night_writer.change_text_writer
        night_writer.make_file("braille.txt")
        handle = File.open("braille.txt", "r")

        expect(handle.read).to be_a(String)
      end
    end

    describe '#file_statement' do
      it 'can show the stats of the files via a string' do
        night_writer.change_text_writer
        night_writer.make_file("braille.txt")

        expect(night_writer.file_statement).to eq ("Created 'braille.txt' from 'message.txt' which had 11 characters.")
      end
    end

    describe 'Bad file' do
      it 'exists' do
        expect(false_writer).to eq( print("The first file is not in the directory. Please input a file that is.") )
      end
    end
  end
end