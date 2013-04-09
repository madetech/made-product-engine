FactoryGirl.define do
  factory :item, class: Product::Item do
    name         "Test Product"
    text         "Test Product text"
    order        1
    image        { File.new(Product::Engine.root.join('spec', 'fixtures', 'test.jpg')) }

    ignore do
      category false
    end
  end

  factory :retailer, class: Product::Retailer do
    name        "Tesco"
    order       1
    url         "http://www.tesco.com"
    image       { File.new(Product::Engine.root.join('spec', 'fixtures', 'test.jpg')) }
  end


  factory :category, class: Product::Category do
    name        "Category"
    order       "1"
    text        "Lorem Ipsum"
  end

  factory :item_with_categories, :parent => :item do |a|
    a.categories { |c| [
        c.association(:category,  name: c.name)
      ]
    }
  end

  factory :item_with_retailers, :parent => :item do |a|
    a.retailers { |c| [
        c.association(:retailer,  name: c.name)
      ]
    }
  end
end
