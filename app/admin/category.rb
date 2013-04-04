if defined?(ActiveAdmin) and Product.config.engine_active_admin
  ActiveAdmin.register Product::Category do

    filter :name
    filter :created_at

    menu :label => 'Categories', :parent => "Products", :priority => 2

    action_item :only => :show do
      link_to "View on site", product_category_path(product_category.url)
    end

    controller do
      cache_sweeper  Product.config.product_category_sweeper if Product.config.product_category_sweeper
      defaults :finder => :find_by_url
    end

    form do |f|
      f.inputs "Category" do
        f.input     :name,
                    :label => 'Product category name'

        f.input     :image,
                    :hint => f.template.image_tag(f.object.image.url(:thumb))

        f.input     :text

        f.input     :order
      end

      f.actions
    end

    index do
      column :name
      column :created_at
      column :updated_at

      default_actions
    end
  end
end
