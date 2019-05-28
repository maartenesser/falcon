class AddReference < ActiveRecord::Migration[5.2]
  def change
    add_column :claims, :user_id, :bigint
    add_foreign_key :claims, :users
  end
end
