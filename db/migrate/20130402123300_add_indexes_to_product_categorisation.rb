class AddIndexesToProductCategorisation < ActiveRecord::Migration
  def change
    add_index :product_categorisations, :category_id
  end
end
