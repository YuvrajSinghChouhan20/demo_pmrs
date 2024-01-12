class CreateRents < ActiveRecord::Migration[7.1]
  def change
    create_table :rents do |t|
      t.integer :rent_amount
      t.integer :rent_status
      t.date :due_date
      t.references :agreement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
