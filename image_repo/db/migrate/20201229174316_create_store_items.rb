class CreateStoreItems < ActiveRecord::Migration[6.1]
  def change
    create_table :store_items do |t|
      t.string :imageurl, null: false
      t.decimal :price, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
