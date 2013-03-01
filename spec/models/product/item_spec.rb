require 'spec_helper'

module Product
  describe Item do

    before(:each) do
      @item = FactoryGirl.create(:item)
    end

    it "creates a new product item" do
      @item.instance_of?(Product::Item)
    end

    it "can't create a new product item without a name" do
      new_item = FactoryGirl.build(:item, :name => nil)
      new_item.should have(1).error_on(:name)
    end

    it "can't create a new product item without some text" do
      new_item = FactoryGirl.build(:item, :text => nil)
      new_item.should have(1).error_on(:text)
    end

    it "can't create a new product item without an image" do
      new_item = FactoryGirl.build(:item, :image => nil)
      new_item.should have(1).error_on(:image)
    end

    it "can create a product without a category" do
      @item.categories.should be_empty
    end

    it "can create a product with a category" do
      new_item = FactoryGirl.create(:item_with_categories, :name => "Item with Category")
    end

    it "returns the name as a string" do
      @item.name.instance_of?(String)
    end

    it "returns a canonical url" do
      category = FactoryGirl.create(:category)
      @item.categories = [category]
      @item.get_canonical_url.instance_of?(String)
      @item.get_canonical_url.should eql "/product/#{ category.url }/#{ @item.url }"
    end

    it "returns true if in category" do
      category = FactoryGirl.create(:category)
      @item.categories = [category]
      @item.in_category(category.url).should be_true
    end

    it "returns false if not in category" do
      category = FactoryGirl.create(:category)
      new_item = FactoryGirl.create(:item_with_categories, :name => "Item with Category")
      new_item.in_category(category.url).should be_false
    end

    it "returns false if category doesn't exist" do
      @item.in_category('fake-category').should be_false
    end

    it "returns two items in the same category in the correct order" do
      category = FactoryGirl.create(:category)
      @item.categories = [category]
      new_item = FactoryGirl.create(:item, :name => 'Second item', :order => 2, :categories => [category])
      items = category.items
      items.count.should eql 2
      items.first.id.should_not eql new_item.id
      items.last.id.should eql new_item.id
    end

  end
end
