class AddTypeToProductItems < ActiveRecord::Migration
	def change
		add_column :product_items, :type, :string
	end
end
