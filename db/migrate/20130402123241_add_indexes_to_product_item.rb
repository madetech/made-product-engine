class AddIndexesToProductItem < ActiveRecord::Migration
  def change
    add_index :product_items, :url
    add_index :product_items, :order
  end
end
