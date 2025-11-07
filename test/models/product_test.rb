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

  # test "total" do 
  #   product = Product.new(price: 10)
  #   assert_equal "$10.90", product.total
  # end

  test "price_money_sign" do 
    product = Product.new(price: 10)
    assert_equal "$10", product.price_money_sign
  end

  test "easy_created_at" do 
    product = Product.new(created_at: "2025-11-05T01:34;27.224Z")
    assert_equal "11/05/2025 1:34 AM", product.easy_created_at
  end

  test "easy_updated_at" do 
    product = Product.new(updated_at: "2025-11-05T01:34;27.224Z")
    assert_equal "11/05/2025 1:34 AM", product.easy_updated_at
  end
end
