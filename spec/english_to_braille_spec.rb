require 'spec_helper'

RSpec.describe EnglishToBraille do
  let(:translator) { EnglishToBraille.new('This is a message.') }
  
  describe 'Iteration 2' do
    describe '#initialize' do
      it 'exists' do
        expect(translator).to be_a(EnglishToBraille)
      end

      it 'has character attribute' do
        expect(translator.message).to be_a(String)
        expect(translator.message).to eq("This is a message.")
      end
    end

    describe '#translate' do
      it 'can change' do
        expect(night_writer.outgoing_text).to eq("THIS IS A MESSAGE.")
      end
    end
  end
end