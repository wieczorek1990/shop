class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :address
      t.integer :value
      t.integer :status
      t.integer :delivery_cost
      t.references :delivery
      t.references :payment_method
      t.references :user

      t.timestamps
    end
    add_index :orders, :address_id
    add_index :orders, :delivery_id
    add_index :orders, :payment_method_id
  end
end
