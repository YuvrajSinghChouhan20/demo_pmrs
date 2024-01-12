class CreateAgreements < ActiveRecord::Migration[7.1]
  def change
    create_table :agreements do |t|
      t.string :duration
      t.date :start_date
      t.date :end_date
      t.integer :amount
      t.integer :agreement_status
      t.references :user, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
