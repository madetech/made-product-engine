require 'stringex'

module Product
  class Category < ActiveRecord::Base
    attr_accessible                   :image,
                                      :order,
                                      :text,
                                      :url,
                                      :name,
                                      :item_ids

    has_many                          :categorisations
    has_many                          :items, :through => :categorisations
    accepts_nested_attributes_for     :categorisations, :allow_destroy => true

    after_destroy                     :remove_associations

    has_attached_file                 :image,
                                      :styles => Product.config.category_image_styles

    validates_presence_of             :order,
                                      :text,
                                      :name

    validates_uniqueness_of           :name

    default_scope                     :order => '`order` ASC'
    scope                             :with_items,
                                      :conditions => 'id in (select distinct category_id from product_categorisations)'
    acts_as_url                       :name

    def to_param
      url
    end

    def to_s
      name
    end

    private
    def remove_associations
      Product::Categorisation.destroy_old_associations('category', self.id)
    end
  end
end
