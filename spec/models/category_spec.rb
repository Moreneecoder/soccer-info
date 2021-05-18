# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    describe 'name' do
      it 'must be present' do
        category = described_class.new(name: 'Africa', priority: 2)
        expect(category).to be_valid

        category.name = nil
        expect(category).to_not be_valid
      end

      it 'must be unique' do
        category = described_class.create(name: 'Internationals', priority: 2)
        new_category = described_class.new(name: 'Grassroots', priority: 1)

        expect(new_category).to be_valid
      end
    end
  end

  describe 'priority' do
    it 'must be present' do
      category = described_class.new(name: 'Africa', priority: 2)
      expect(category).to be_valid

      category.priority = nil
      expect(category).to_not be_valid
    end
  end
end
