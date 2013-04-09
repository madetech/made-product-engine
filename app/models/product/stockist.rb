module Product
  class Stockist < ActiveRecord::Base
    attr_accessible               :item_id,
                                  :retailer_id

    belongs_to                    :item
    belongs_to                    :retailer

    def to_s
      self.product_retailer
    end
  end
end
