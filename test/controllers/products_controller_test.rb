require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.count
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name","image_url", "price", "inventory",  "description", "seller","is_discounted", "tax", "total", "easy_created_at", "easy_updated_at"],
    data.keys
  end

  test "create" do 
    assert_difference "Product.count", 1 do
      post "/products.json", params: { name: "Monitor", image_url: "image.jpg", price: 130, description: "A 4k screen with 120 FPS and LED", seller: "acer", inventory: 17}
      assert_response 201
    end
    assert_difference "Product.count", 0 do
      post "/products.json", params:{}
      assert_response 422
    end
  end
end
