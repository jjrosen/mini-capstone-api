class SuppliersController < ApplicationController
  def show
    @supplier = Supplier.find(params[:id])

    render :show
  end

  def index 
    @suppliers= Supplier.all
  
    render :index
  end

  def create
    @supplier = Supplier.new(
      name: params[:name],
      phone_number: params[:phone_number],
      email: params[:email]
      )

      if @supplier.save
        render :show, status: :created
      else
        render json: {errors: @supplier.errors}, status: :unprocessable_entity
      end
  end

  def update 
    @supplier = Supplier.find(params[:id])

    Supplier.update(
      name: params[:name]|| @supplier.name, 
      phone_number: params[:phone_number] || @supplier.phone_number,
      email: params[:email] || @supplier.email
    )

    if @supplier.valid?
      render :show
    else
      render json: {errors: @supplier.errors}, status: :unprocessable_entity
    end
  end

  def delete
    @supplier = Supplier.find(params[:id])

    @supplier.destroy

    render json: {message: "Supplier was removed from Database"}
  end

end
