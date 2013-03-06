Product.config do |config|
  config.product_item_sweeper = false
  config.product_category_sweeper = false
  config.engine_routing = true
  config.product_category_class = Product::Category
  config.product_item_class = Product::Item
end
