class CreateUserAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :user_accounts do |t|
      t.decimal :wallet
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
