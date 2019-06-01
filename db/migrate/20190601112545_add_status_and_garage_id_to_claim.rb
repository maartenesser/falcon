class AddStatusAndGarageIdToClaim < ActiveRecord::Migration[5.2]
  def change
    add_column :claims, :status, :string, default: "new"
    add_column :claims, :garage_id, :bigint
  end
end
