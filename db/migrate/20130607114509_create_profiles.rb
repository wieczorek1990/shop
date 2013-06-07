class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :telephone_number
      t.integer :newsletter
      t.references :user

      t.timestamps
    end
  end
end
