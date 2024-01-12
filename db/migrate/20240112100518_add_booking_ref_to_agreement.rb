class AddBookingRefToAgreement < ActiveRecord::Migration[7.1]
  def change
    add_reference :agreements, :booking, null: false, foreign_key: true
  end
end
