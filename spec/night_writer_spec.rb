require 'spec_helper'

RSpec.describe NightWriter do
  let(:night_writer){NightWriter.new}
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