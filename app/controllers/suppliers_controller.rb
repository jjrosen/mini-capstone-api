class SuppliersController < ApplicationController
  def show
    @supplier = Supplier.find(params[:id])

    render :show
  end

  def index 
    @supplier = Supplier.all
    "----------"
    p @supplier
    "----------"
    render :index
  end





end
