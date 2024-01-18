class Rent < ApplicationRecord
  belongs_to :agreement
  has_one :payment, as: :paymentable

  enum rent_status: { paid: 1, pending: 2, over_due: 3}


  def self.pending_rents
    Rent.where(rent_status: :pending)
  end
end
