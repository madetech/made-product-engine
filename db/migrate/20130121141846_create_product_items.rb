class CreateProductItems < ActiveRecord::Migration
  def change
    create_table :product_items do |t|
      t.string      :title
      t.string      :url
      t.text        :text
      t.integer     :order, :default => 9999

      t.timestamps
    end

    add_attachment :product_items, :image

  end
end
