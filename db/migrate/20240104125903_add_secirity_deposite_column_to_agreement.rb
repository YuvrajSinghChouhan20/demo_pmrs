class AddSecirityDepositeColumnToAgreement < ActiveRecord::Migration[7.1]
  def change
    add_column :agreements, :security_amount, :integer
  end
end
