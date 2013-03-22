module Product
  class ProductController < Product::ApplicationController
    layout 'application'

    def index
      @categories = Product::Category.with_items
    end

    def products_by_category
      @category = Product::Category.find_by_url!(params[:category])
      @products = Product::Item.get_products_in_category(@category)
    end

    def product_item
      @category = Product::Category.find_by_url!(params[:category])
      @product = Product::Item.find_by_url!(params[:product])

      raise ActiveRecord::RecordNotFound.new('Page not found') if !@product.in_category(params[:category])
    end
  end
end
