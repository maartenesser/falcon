class AddConditionParts < ActiveRecord::Migration[5.2]
  def change
    add_column :parts, :condition, :string
  end
end
