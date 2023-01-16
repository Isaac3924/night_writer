require 'spec_helper'

RSpec.describe NightWriterClass do
  let(:night_writer) { 
    file_name1 = 'message.txt'
    file_name2 = 'changed.txt'

    NightWriterClass.new(file_name1, file_name2) 
  }

  describe 'Iteration 1' do
    describe '#initialize' do
      it 'exists' do
        expect(night_writer).to be_a(NightWriterClass)
      end

      it 'can open' do
        expect(night_writer.handle).to be_a(File)
      end
    end
  end
end