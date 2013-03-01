module Product
  class ProductController < Product::ApplicationController
    layout 'application'

    def index
      @categories = Category.with_items
    end

    def products_by_category
      @category = Category.find_by_url!(params[:category])
      @products = @category.items
    end

    def product_item
      @category = Category.find_by_url!(params[:category])
      @product = Product.config.product_item_class.find_by_url!(params[:product])

      raise ActiveRecord::RecordNotFound.new('Page not found') if !@product.in_category(params[:category])
      raise ActiveRecord::RecordNotFound.new('Page not found') if @product.blank?
    end

  end
end
