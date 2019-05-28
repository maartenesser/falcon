class DropInsuranceTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :insurances do |t|
      t.string "name"
      t.string "email"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end

