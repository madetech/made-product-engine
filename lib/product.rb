require "product/engine"

module Product
  mattr_accessor :product_item_sweeper
  @@product_item_sweeper = false

  mattr_accessor :product_category_sweeper
  @@product_category_sweeper = false

  mattr_accessor :product_retailer_sweeper
  @@product_retailer_sweeper = false

  mattr_accessor :engine_routing
  @@engine_routing = false

  mattr_accessor :engine_active_admin
  @@engine_active_admin = true

  mattr_accessor :show_product_stockists
  @@show_product_stockists = false

  mattr_accessor :retailer_image_styles
  @@retailer_image_styles = false

  class Engine < Rails::Engine
    isolate_namespace Product

    initializer :product do
      ActiveAdmin.application.load_paths.unshift Dir[Product::Engine.root.join('app', 'admin')] if defined?(ActiveAdmin)
    end
  end

  def self.config(&block)
    yield self if block
    return self
  end
end
