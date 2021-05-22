class Article < ApplicationRecord
  include ImageUploader::Attachment(:image)

  validates :author_id, presence: true
  validates :title, presence: true, length: { maximum: 70 }
  validates :text, presence: true
  validates :image, presence: true
  validates :category_id, presence: true

  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :category
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
