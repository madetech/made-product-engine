module Product
  class ProductController < Product::ApplicationController
    layout 'application'

    def index
      @categories = Product.config.product_category_class.with_items
    end

    def products_by_category
      @category = Product.config.product_category_class.find_by_url!(params[:category])
      @products = Product.config.product_item_class.get_products_in_category(@category)
    end

    def product_item
      @category = Product.config.product_category_class.find_by_url!(params[:category])
      @product = Product.config.product_item_class.find_by_url!(params[:product])

      raise ActiveRecord::RecordNotFound.new('Page not found') if !@product.in_category(params[:category])
    end
  end
end
