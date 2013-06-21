module Product
  class Retailer < ActiveRecord::Base
    attr_accessible                   :image,
                                      :order,
                                      :url,
                                      :name,
                                      :item_ids

    has_many                          :stockists, :dependent => :destroy
    has_many                          :items, :through => :stockists
    accepts_nested_attributes_for     :stockists, :allow_destroy => true

    has_attached_file                 :image,
                                      :styles => Product.config.retailer_image_styles

    validates_presence_of             :order,
                                      :url,
                                      :name,
                                      :image

    validates_uniqueness_of           :name

    validates_attachment_presence     :image

    default_scope                     :order => '`order` ASC'

    def to_s
      name
    end
  end
end
