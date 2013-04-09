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
                                      :styles => {
                                        :icon =>  ["20x20", :png],
                                        :thumb => ["70x70", :png]
                                      }

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
