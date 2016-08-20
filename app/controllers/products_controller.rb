class ProductsController < ApplicationController
  # before_filter :authenticate_user!

  def index
    @products = Product.all
  end

  def deal_detail
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @purchase_list = current_user.purchase_lists.new
    InfluencerStore.increment_counter(:user_point, params[:influencer_store_id])
  end

  def sub_index

  end

  def about
  end

  def email_send
    Contact.recruit(params[:title], params[:contents], params[:giver], params[:attachment]).deliver_now
    redirect_to '/products/complete'
  end
end
