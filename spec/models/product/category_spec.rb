require 'spec_helper'

module Product
  describe Category do

    before(:each) do
      @category = FactoryGirl.create(:category)
    end

    it "creates a new product category" do
      @category.instance_of?(Product::Category)
    end

    it "can't create a new product category without a name" do
      new_category = FactoryGirl.build(:category, :name => nil)
      new_category.should have(1).error_on(:name)
    end

    it "can't create a new product category without some text" do
      new_category = FactoryGirl.build(:category, :text => nil)
      new_category.should have(1).error_on(:text)
    end

    it "can create a product category without an image" do
      new_category = FactoryGirl.build(:category, :image => nil)
      new_category.instance_of?(Product::Category)
    end

    it "can create a product category without any items" do
      @category.items.should be_empty
    end

    it "return the category name as a string" do
      @category.name.instance_of?(String)
    end

  end
end
