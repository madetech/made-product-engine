class CreateProductRetailers < ActiveRecord::Migration
  def change
    create_table :product_retailers do |t|
      t.string      :name
      t.string      :url
      t.integer     :order, :default => 9999

      t.timestamps
    end

    add_attachment  :product_retailers, :image
  end
end
