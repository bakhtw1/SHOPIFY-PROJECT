class AddIndexToStoreItems < ActiveRecord::Migration[6.1]
  def change
    add_index :store_items, :imageurl, unique: true
  end
end
