class RemoveOrderIdFromParts < ActiveRecord::Migration[5.2]
  def change
    remove_column :parts, :order_id
  end
end
