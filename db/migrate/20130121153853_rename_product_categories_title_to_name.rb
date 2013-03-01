class RenameProductCategoriesTitleToName < ActiveRecord::Migration
  def change
    rename_column :product_categories, :title, :name
  end
end
