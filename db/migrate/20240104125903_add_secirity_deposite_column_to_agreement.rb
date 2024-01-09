class AddSecirityDepositeColumnToAgreement < ActiveRecord::Migration[7.1]
  def change
    add_column :agreements, :security_deposit, :integer
  end
end
