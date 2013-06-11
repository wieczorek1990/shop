class CreateOrderPositions < ActiveRecord::Migration
  def change
    create_table :order_positions do |t|
      t.references :product
      t.references :container
      t.integer :price
      t.integer :amount

      t.timestamps
    end
    add_index :order_positions, :product_id
  end
end
