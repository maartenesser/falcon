class AddPriceCentstoParts < ActiveRecord::Migration[5.2]
  def change
    add_column :parts, :price_cents, :integer
  end
end
