class CreateBaskets < ActiveRecord::Migration
  def change
    create_table :baskets do |t|
      t.references :user

      t.timestamps
    end
    add_index :baskets, :user_id
  end
end
