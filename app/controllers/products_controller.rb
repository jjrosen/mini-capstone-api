class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])

    render :show
  end

  def index
    @products = Product.all
    render :index
  end
  
  def create
    @product = Product.create(
      name: params[:name],
    price: params[:price],
    image_url: params[:image_url],
    description: params[:description],
    seller: params[:seller]
    )

    render :show
  end

def update
  @product = Product.find(params[:id])
  
  Product.update(
    name: params[:name]|| @product.name,
    price: params[:price]|| @product.price,
    image_url: params[:image_url]|| @product.image_url,
    description: params[:description]|| @product.description,
    seller: params[:seller] || @product.seller
  )

  render :show
end

def delete
   @product = Product.find(params[:id])

   @product.destroy

   render json: {message: "Product Removed from Page"}
end






end
