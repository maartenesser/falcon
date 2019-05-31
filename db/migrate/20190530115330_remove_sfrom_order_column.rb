class RemoveSfromOrderColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :parts_id
    add_reference :orders, :part
  end
end
