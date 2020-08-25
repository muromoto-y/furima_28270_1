class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer :price   ,null: false
      t.integer :item_id ,null: false
      t.integer :user_id ,null: false

      t.timestamps
    end
  end
end
