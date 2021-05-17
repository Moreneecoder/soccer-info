# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20, minimum: 2 }, uniqueness: true

  has_many :articles, foreign_key: :author_id, dependent: :destroy
  has_many :votes, dependent: :destroy
end
