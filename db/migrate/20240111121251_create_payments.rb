class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.integer :payment_amount
      t.date :payment_date
      t.integer :payment_status
      t.references :paymentable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
