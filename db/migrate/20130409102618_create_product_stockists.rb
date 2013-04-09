class CreateProductStockists < ActiveRecord::Migration
  def change
    create_table :product_stockists do |t|
      t.integer  :item_id
      t.integer  :retailer_id

      t.timestamps
    end
  end
end
