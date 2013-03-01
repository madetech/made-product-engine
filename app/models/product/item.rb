require 'stringex'

module Product
  class Item < ActiveRecord::Base
    if Product.config.engine_routing
      include Product::Engine.routes.url_helpers
    else
      include Rails.application.routes.url_helpers
    end

    has_many                        :categorisations
    has_many                        :categories, :through => :categorisations
    accepts_nested_attributes_for   :categorisations, :allow_destroy => true

    attr_accessible                 :image,
                                    :order,
                                    :text,
                                    :url,
                                    :name,
                                    :category_ids


    has_attached_file               :image,
                                    :styles => {
                                      :large => ["500x500#", :jpg],
                                      :small => ["250x250#", :jpg],
                                      :thumb => ["70x70#", :jpg]
                                    }

    validates_presence_of           :order,
                                    :text,
                                    :name

    validates_attachment_presence   :image

    acts_as_url                     :name

    default_scope                   :order => '`order` ASC'

    def in_category(category_slug)

      begin
        category = Category.find_by_url!(category_slug)
      rescue => error
        return false
      end

      self.categories.include?(category)
    end

    def get_canonical_url
      product_item_path(self.categories.first, self)
    end

    def to_param
      url
    end

    def to_s
      name
    end

  end
end
