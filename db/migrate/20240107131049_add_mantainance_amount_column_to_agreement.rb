class AddMantainanceAmountColumnToAgreement < ActiveRecord::Migration[7.1]
  def change
    add_column :agreements, :maintance_amount, :bigint
  end
end
