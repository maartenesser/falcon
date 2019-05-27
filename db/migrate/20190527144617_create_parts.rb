class CreateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts do |t|
      t.string :part_model_code
      t.string :title
      t.string :description
      t.string :category
      t.references :car, foreign_key: true
      t.references :user, foreign_key: true
      t.references :claim, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
