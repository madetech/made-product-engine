if Product.config.engine_routing
  Product::Engine.routes.draw do
    root                          :to => 'product#index',                :as => 'products'

    match '/:category',           :to => 'product#products_by_category', :as => 'product_category', :via => [:get]
    match '/:category/:product',  :to => 'product#product_item',         :as => 'product_item',     :via => [:get]
  end
end
