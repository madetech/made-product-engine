require 'test_helper'

module Product
  class ProductTest < ActiveSupport::TestCase

    test "truth" do
      assert_kind_of Module, Product
    end

  end
end