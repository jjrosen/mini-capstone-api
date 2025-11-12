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
    assert_equal ["id", "name","image_url", "price", "inventory",  "description", "supplier_id","is_discounted", "tax", "total", "easy_created_at", "easy_updated_at", "supplier"],
    data.keys
  end

  test "create" do 
    assert_difference "Product.count", 1 do
      post "/products.json", params: { name: "Monitor", image_url: "image.jpg", price: 130, description: "A 4k screen with 120 FPS and LED", supplier_id: Supplier.first.id, inventory: 17}
      assert_response 201
    end
    assert_difference "Product.count", 0 do
      post "/products.json", params:{}
      assert_response 422
    end
  end

  test "update" do 
    product = Product.first
    put "/products/#{product.id}.json", params: {name: "Desk", supplier_id: Supplier.first.id}
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Desk", data["name"]


      put "/products/#{product.id}.json", params: {name: ""} 
      assert_response 422
  end







end
