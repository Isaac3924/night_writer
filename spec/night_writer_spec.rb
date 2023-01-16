require 'spec_helper'

RSpec.describe NightWriterClass do
  let(:night_writer) { 
    file_name1 = 'message.txt'
    file_name2 = 'changed.txt'

    NightWriterClass.from_terminal(file_name1, file_name2) 
  }

  let(:false_writer) { 
    file_name1 = 'mess.txt'
    file_name2 = 'changed.txt'

    NightWriterClass.from_terminal(file_name1, file_name2) 
  }
  
  describe 'Iteration 1' do
    describe '#initialize' do

      it 'exists' do
        expect(night_writer).to be_a(NightWriterClass)
      end

      it 'can open' do
        expect(night_writer.handle).to be_a(File)
        expect(night_writer.incoming_text).to be_a(String)
        expect(night_writer.incoming_text).to eq("This is a message.")
      end

      it 'can change' do
        expect(night_writer.writer).to be_a(File)
        expect(night_writer.outgoing_text).to be_a(String)
        expect(night_writer.outgoing_text).to eq("THIS IS A MESSAGE.")
      end
    end

    describe 'Bad file' do
      it 'exists' do
        expect(false_writer).to eq( print("The first file is not in the directory. Please input a file that is.") )
      end
    end
  end
end