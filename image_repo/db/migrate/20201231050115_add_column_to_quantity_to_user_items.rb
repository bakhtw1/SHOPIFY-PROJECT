class AddColumnToQuantityToUserItems < ActiveRecord::Migration[6.1]
  def change
    add_column :user_items, :quantity, :integer
  end
end
