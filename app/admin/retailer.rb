if defined?(ActiveAdmin) and Product.config.engine_active_admin
  ActiveAdmin.register Product::Retailer, {:sort_order => :order} do

    filter :name

    menu :label => 'Retailers', :parent => "Products", :priority => 3

    controller do
      cache_sweeper  Product.config.product_retailer_sweeper if Product.config.product_retailer_sweeper
    end

    form do |f|
      f.inputs "Category" do
        f.input     :name,
                    :label => 'Retailer name'

        f.input     :image,
                    :hint => f.template.image_tag(f.object.image.url(:thumb))

        f.input     :url

        f.input     :order
      end

      f.actions
    end

    index do
      column :name
      column :url

      default_actions
    end
  end
end
