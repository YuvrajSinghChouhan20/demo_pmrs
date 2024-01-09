class AddAgreementStatusToAgreement < ActiveRecord::Migration[7.1]
  def change
    add_column :agreements, :agreement_status, :integer
  end
end
