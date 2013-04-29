class AddIndexesToProductStockists < ActiveRecord::Migration
  def change
    add_index :product_stockists, :item_id
    add_index :product_stockists, :retailer_id
  end
end
