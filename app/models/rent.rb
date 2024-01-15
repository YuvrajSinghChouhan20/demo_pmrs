class Rent < ApplicationRecord
  belongs_to :agreement
  has_one :payment, as: :paymentable
end
