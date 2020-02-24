class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,                   null: false, index: true
      t.text :description,              null: false
      t.integer :price,                 null: false, index: true
      t.boolean :stock_status,          null: false, default: true
      t.integer :condition_id,          null: false, foreign_key: true
      t.integer :shipping_fee_who_id,   null: false, foreign_key: true
      t.integer :prefecture_id,         null: false, foreign_key: true
      t.integer :shipping_days_id,      null: false, foreign_key: true
      t.references :user,               null: false, foreign_key: true
      t.references :brand,              foreign_key: true
      t.references :category,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
