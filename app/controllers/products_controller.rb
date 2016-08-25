class ProductsController < ApplicationController
  # before_filter :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound do |e|
    redirect_to request.referrer.presence || root_path, flash: {error: "상품을 찾을 수 없습니다"}
  end

  def index
    @products = Product.sellable
  end

  def deal_detail
    @products = Product.all
  end

  def show
    @product = Product.sellable.find(params[:id])
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
