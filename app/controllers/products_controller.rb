class ProductsController < ApplicationController
  def one_product
    @product = Product.find(1)
    render json: "products/show"
  end

  def all_products
    @products = Product.all
    render json: "products/index"
  end 
end
