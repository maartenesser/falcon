class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :content
      t.boolean :insurance_read, default: false
      t.boolean :garage_read, default: false
      t.references :claim, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
