class Property < ApplicationRecord
  before_create :set_property_status

  resourcify
  belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :agreements, dependent: :destroy
  has_many :reviews, dependent: :destroy

  def has_active_agreement?
    self.agreements.where(agreement_status: "accepted").any?
  end

  def average_ratings
    self.reviews.average(:ratings)
  end

  def count_one_star
    self.reviews.where(ratings: 1).count
  end

  def recent_reviews
    self.reviews.sample 2
  end

  def total_reviews
    self.reviews.count
  end
  private
  def set_property_status
    self.status = "Available"
  end
end
