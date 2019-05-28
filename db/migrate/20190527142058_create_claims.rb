class CreateClaims < ActiveRecord::Migration[5.2]
  def change
    create_table :claims do |t|
      t.string :number
      t.datetime :at_date
      t.text :description
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
