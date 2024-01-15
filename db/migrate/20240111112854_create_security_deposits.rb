class CreateSecurityDeposits < ActiveRecord::Migration[7.1]
  def change
    create_table :security_deposits do |t|
      t.integer :deposit_amount
      t.integer :deposit_status
      t.references :agreement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
