require "test_helper"

class ProductTest < ActiveSupport::TestCase

  test "is_discounted" do 
    product = Product.new(price: 23)
    assert_equal false, product.is_discounted
  end

  test "tax" do 
    product = Product.new(price: 10)
    assert_equal "$0.9", product.tax
  end


end
