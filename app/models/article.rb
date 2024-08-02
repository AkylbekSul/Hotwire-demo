class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :body, presence: true

  scope :ordered, -> { order(id: :desc) }
end
