class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.integer :registraion_no
      t.string :state
      t.string :city
      t.string :country
      t.integer :zipcode
      t.string :property_type
      t.string :listed_for
      t.string :size
      t.string :status

      t.timestamps
    end
  end
end
