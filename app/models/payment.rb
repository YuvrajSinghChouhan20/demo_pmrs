class Payment < ApplicationRecord
  belongs_to :paymentable, polymorphic: true
  belongs_to :user

  enum payment_status: { pending: 0, paid: 1, failed: 2}
end
