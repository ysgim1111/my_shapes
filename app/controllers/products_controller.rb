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

  def email_send
        title = params[:title]
        contents = params[:contents]
        giver = params[:giver]
        file = params[:attachment]
        Contact.recruit(title, contents, giver, file).deliver_now
        redirect_to '/products/about'
  end
end
