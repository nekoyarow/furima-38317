class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :zipcode, null: false
      t.integer :area_id, null: false
      t.string :city, null: false
      t.string :address1, null: false
      t.string :address2, null: false
      t.string :phone, null: false
      t.references :purchases, null: false, foreign_key: true
      t.timestamps
    end
  end
end
