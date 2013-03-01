class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.string      :title
      t.string      :url
      t.text        :text
      t.integer     :order, :default => 9999

      t.timestamps
    end

    add_attachment :product_categories, :image

  end
end
