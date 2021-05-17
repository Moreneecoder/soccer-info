require 'rails_helper'

RSpec.describe 'Test', type: :feature do
    describe 'Testing' do
      it 'should sum up two numbers' do
          expect(2 + 2).to eq 4
      end
    end
    
end