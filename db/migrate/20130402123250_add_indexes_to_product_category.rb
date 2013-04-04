class AddIndexesToProductCategory < ActiveRecord::Migration
  def change
    add_index :product_categories, :name
    add_index :product_categories, :url
    add_index :product_categories, :order
  end
end
