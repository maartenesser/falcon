class RemoveInsuranceFromClaims < ActiveRecord::Migration[5.2]
  def change
    remove_column :claims, :insurance_id
  end
end
