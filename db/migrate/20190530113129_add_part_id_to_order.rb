class AddPartIdToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :parts
  end
end
