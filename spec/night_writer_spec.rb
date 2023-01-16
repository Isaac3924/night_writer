require 'spec_helper'

RSpec.describe NightWriter do
  let(:night_writer) { 
    file_name1 = 'message.txt'
    file_name2 = 'changed.txt'

    StatTracker.from_terminal(file_name1, file_name2) 
  }

  describe 'Iteration 1' do
    describe '#initialize' do
      it 'exists' do
        expect(night_writer).to be_a(NightWriter)
        require 'pry'; binding.pry
      end

      it 'can open' do
        expect(night_writer.handle).to eq(NightWriter)
      end
    end
  end
end