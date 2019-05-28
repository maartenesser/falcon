class AddInsuranceToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :insurance, :boolean
  end
end
