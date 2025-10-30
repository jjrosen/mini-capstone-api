class ProductsController < ApplicationController
  def one_product
    @product = Product.find(1)
    render json: format: "products/show"
  end

  def all_products
    @products = Product.all
    render json: format: "products/index"
  end 
end
