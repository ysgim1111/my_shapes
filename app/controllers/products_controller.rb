class ProductsController < ApplicationController

  # before_filter :authenticate_user!

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def about
  end
end
