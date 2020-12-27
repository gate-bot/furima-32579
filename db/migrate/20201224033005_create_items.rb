class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :product_name,        null: false
      t.text :explanation,         null: false
      t.integer :category_id,      null: false
      t.integer :state_id,         null: false
      t.integer :bearer_id,        null: false
      t.integer :prefecture_id,    null: false
      t.integer :delivery_date_id, null: false
      t.integer :price,            null: false
      t.references :user,          foreign_key: true

      t.timestamps
    end
  end
end
