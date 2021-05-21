class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :priority, presence: true

  has_many :articles, dependent: :destroy
end
