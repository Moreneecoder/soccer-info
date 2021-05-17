require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { described_class.new(name: 'Someone') }
  let(:another_user) { described_class.new(name: 'Somebody') }

  describe 'validations' do
    describe 'name' do
      it 'must be present' do
        user = described_class.new(name: 'JohnDoe')
        expect(user).to be_valid

        user.name = nil
        expect(user).to_not be_valid
      end

      it 'must be unique' do
        unique_user = described_class.create!(name: 'Another One')
        expect(user).to be_valid

        unique_user = described_class.create!(name: 'Someone')
        expect(user).to_not be_valid
      end

      it 'must be longer than two characters' do
        expect(another_user).to be_valid

        another_user.name = 'A'
        expect(another_user).to_not be_valid
      end

      it 'must not be longer than twenty characters' do

        another_user.name = 'Abcbefghij Abcbefghijkl'
        expect(another_user).to_not be_valid
      end

    end
  end

  describe 'associations' do
    user = User.reflect_on_association(:articles)

    it 'has many articles' do
      expect(user.macro).to eq(:has_many)
    end

    it 'has many votes' do
        expect(user.macro).to eq(:has_many)
      end
  end

end