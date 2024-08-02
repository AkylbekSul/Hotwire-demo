class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :text, presence: true

  scope :ordered, -> { order(id: :desc) }
end
