class RenameProductItemsTitleToName < ActiveRecord::Migration
  def change
    rename_column :product_items, :title, :name
  end
end
