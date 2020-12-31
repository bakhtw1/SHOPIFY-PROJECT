class CreateUserItems < ActiveRecord::Migration[6.1]
  def change
    create_table :user_items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :store_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
