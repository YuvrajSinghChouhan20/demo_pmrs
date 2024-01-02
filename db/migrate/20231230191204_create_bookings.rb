class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :booking_status
      t.string :booking_date
      t.string :booking_for
      t.references :user, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
