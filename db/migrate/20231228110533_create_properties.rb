class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :property_name
      t.string :property_about
      t.string :state
      t.string :city
      t.integer :zipcode
      t.string :property_type
      t.string :sub_property_type
      t.string :listed_for
      t.string :property_size
      t.string :status
      t.text :address
      t.integer :price
      t.boolean :verified, default: false

      t.timestamps
    end
  end
end
