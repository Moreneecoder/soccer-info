# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe 'associations:' do
    it 'belongs to a user' do
      vote = Vote.reflect_on_association(:user)
      expect(vote.macro).to eq(:belongs_to)
    end

    it 'belongs to an article' do
      vote = Vote.reflect_on_association(:article)
      expect(vote.macro).to eq(:belongs_to)
    end
  end
end
