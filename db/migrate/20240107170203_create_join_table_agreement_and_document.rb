class CreateJoinTableAgreementAndDocument < ActiveRecord::Migration[7.1]
  def change
    create_join_table :agreements, :documents do |t|
      t.index [:agreement_id, :document_id]
      t.index [:document_id, :agreement_id]
    end
  end
end
