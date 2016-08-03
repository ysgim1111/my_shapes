class ProductsController < ApplicationController
  before_filter :authenticate_user!, only: [:purchases_ready, :purchases_complete]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def about
  end

  def email_send
    Contact.recruit(params[:title], params[:contents], params[:giver], params[:attachment]).deliver_now
    redirect_to '/products/complete'
  end
end
