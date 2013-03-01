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
    accepts_nested_attributes_for     :categorisations

    has_attached_file                 :image,
                                      :styles => {
                                        :large => ["500x500#", :jpg],
                                        :small => ["250x250#", :jpg],
                                        :nav_thumb => ["86x119#", :jpg],
                                        :thumb => ["70x70#", :jpg]
                                      }

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

  end
end
