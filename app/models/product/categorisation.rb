module Product
  class Categorisation < ActiveRecord::Base

    attr_accessible               :item_id,
                                  :category_id

    belongs_to                    :item
    belongs_to                    :category

    def to_s
      self.category
    end

    def self.destroy_old_associations(field, id)
      where("#{field}_id = ?", id).destroy_all
    end
  end
end
