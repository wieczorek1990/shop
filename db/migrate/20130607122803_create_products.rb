class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :category
      t.string :name
      t.text :description
      t.references :producer
      t.integer :availability
      t.integer :net_price
      t.integer :gross_price

      t.timestamps
    end
    add_index :products, :category_id
    add_index :products, :producer_id
  end
end
