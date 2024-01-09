class Review < ApplicationRecord
  belongs_to :user
  belongs_to :property
  has_many_attached :images

  validates :title, presence: true
  validates :description, presence: true

  validates :ratings, inclusion: { in: [1,2,3,4,5] }
end
