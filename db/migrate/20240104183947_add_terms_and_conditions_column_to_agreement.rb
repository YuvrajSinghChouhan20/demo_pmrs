class AddTermsAndConditionsColumnToAgreement < ActiveRecord::Migration[7.1]
  def change
    add_column :agreements, :terms_and_conditions, :text, array: true
  end
end
