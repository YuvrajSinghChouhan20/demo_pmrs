class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :property
  before_create :add_booking_status
  enum booking_status: { pending: 0, confirmed: 1, canceled: 2}

  private
  def add_booking_status
    self.booking_status = :pending
  end
end
