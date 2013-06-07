class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_line_1
      t.string :address_line_2
      t.string :postal_code
      t.string :city
      t.references :country
      t.references :user

      t.timestamps
    end
    add_index :addresses, :country_id
  end
end
