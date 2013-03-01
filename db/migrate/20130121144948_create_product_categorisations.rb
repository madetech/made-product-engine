class CreateProductCategorisations < ActiveRecord::Migration
  def change
    create_table :product_categorisations do |t|
      t.integer :item_id
      t.integer :category_id

      t.timestamps
    end
  end
end
