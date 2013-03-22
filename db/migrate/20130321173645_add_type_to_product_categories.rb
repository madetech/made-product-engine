class AddTypeToProductCategories < ActiveRecord::Migration
  def change
    add_column :product_categories, :type, :string
  end
end
