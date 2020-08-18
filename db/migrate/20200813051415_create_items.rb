class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,               null: false
      t.text    :explanation,        null: false
      t.integer :price,              null: false
      t.integer :category_id,        null: false
      t.integer :status,             null: false
      t.integer :shipping_burden,    null: false
      t.integer :shipping_area,      null: false
      t.integer :shipping_days,      null: false
      t.timestamps
    end
  end
end
