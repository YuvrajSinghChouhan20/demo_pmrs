class SecurityDeposit < ApplicationRecord
  belongs_to :agreement
  has_one :payment, as: :paymentable

  validates :deposit_amount, presence: true
  enum deposit_status: { pending: 0, processing: 1, paid: 2, canceled: 3, failed: 4}
end
