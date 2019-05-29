class AddPriceToParts < ActiveRecord::Migration[5.2]
  def change
    add_monetize :parts, :price, currency: { present: false }
  end
end
