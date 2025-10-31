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
    @product = Poduct.create(
      name: Faker::Appliance.equipment,
    price: Faker::Commerce.price,
    image_url: Faker::LoremFlickr.image(search_terms: ['appliance']),
    description: Faker::Lorem.paragraph(sentence_count: 6),
    seller: Faker::Company.name
    )
  end

end
