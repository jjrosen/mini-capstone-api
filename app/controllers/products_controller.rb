class ProductsController < ApplicationController
  def show
    @product = Product.find(params["id"])

    render template: "products/show"
  end

  def index
    @products = Product.all
    render template: "products/index"
  end
  
  def create
    @product = Product.create(
      name: params[:name],
    price: params[:price],
    image_url: params[:image_url],
    description: params[:description],
    seller: params[:seller]
    )

    render template: "products/show"
  end

end
