class Comment < ApplicationRecord
  validates :body, presence: true, length: { maximum: 250 }

  belongs_to :user
  belongs_to :article
end
