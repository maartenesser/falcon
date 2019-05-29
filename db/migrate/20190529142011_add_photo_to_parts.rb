class AddPhotoToParts < ActiveRecord::Migration[5.2]
  def change
    add_column :parts, :photo, :string
  end
end
