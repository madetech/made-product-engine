if defined?(ActiveAdmin) and Product.config.engine_active_admin
  ActiveAdmin.register Product::Item do

    filter :name
    filter :category
    filter :created_at

    menu :label => 'Individual Product', :parent => "Products", :priority => 1

    action_item :only => :show do
      link_to "View on site", product_item.get_canonical_url
    end

    controller do
      cache_sweeper  Product.config.product_item_sweeper if Product.config.product_item_sweeper
      defaults :finder => :find_by_url
    end

    form do |f|
      f.inputs "Product" do
        f.input     :name,
                    :label => 'Product Name'

        f.input     :image,
                    :hint => f.template.image_tag(f.object.image.url(:thumb))

        f.input     :text

        f.input     :categories,
                    :label => 'Categories',
                    :as => :check_boxes,
                    :multiple => true

        f.input     :order
      end

      f.buttons
    end

    index do
      column :name
      column :created_at
      column :updated_at

      default_actions
    end

  end
end
