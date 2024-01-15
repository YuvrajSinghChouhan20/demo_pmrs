class Property < ApplicationRecord
  resourcify
  belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :agreements, dependent: :destroy
  has_many :reviews, dependent: :destroy
  before_create :set_property_status

  enum property_status: { available: 1, rented: 2, sold: 3}

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

  def is_already_booked?(user)
    self.bookings.where(user_id: user.id, booking_status: :pending).any?
  end

  def agreement_already_created?(user)
    self.agreements.where(user_id: user.id, agreement_status: :draft).any?
  end

  private
  def set_property_status
    self.status = "Available"
  end
end
