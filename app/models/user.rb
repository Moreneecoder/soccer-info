class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 20, minimum: 2}, uniqueness: true
end
