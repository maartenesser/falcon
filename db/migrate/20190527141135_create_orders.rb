class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :status, default: "pending"
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
