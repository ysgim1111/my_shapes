class ProductsController < ApplicationController

  # before_filter :authenticate_user!

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])

    render "products/product#{params[:id]}"
  end

  def about
  end

  def email_send
    Contact.recruit(params[:title], params[:contents], params[:giver], params[:attachment]).deliver_now
    redirect_to '/products/complete'
  end

  def purchases_complete
    @product = Product.find(params[:product_id])
  end

  def purchases_ready
    @product = Product.find(params[:product_id])
  end
end
