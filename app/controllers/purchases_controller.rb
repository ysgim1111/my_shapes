class PurchasesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @purchase_lists = current_user.purchase_lists
  end

  def show
    @purchase_list = PurchaseList.find(params[:id])
  end

  def new
    shopping_items = ShoppingItem.find_and_update(params[:product_id], current_user)
    @product = Product.find(params[:product_id])
  end

  def create
    # purchase_list = PurchaseList.new(order_number: params["merchant_uid"])
    # purchase_list.user_id = current_user.present? ? current_user.id : 1
    # purchase_list.purchase_result = PurchaseResult.new(params)
    # purchase_list.save

    render json: params
  end

  def save_post
    destination = Destination.create(receiver: params[:receiver], phone_number: params[:phone_number], zonecode: params[:zonecode], address: params[:address]) do |destination|
      destination.user = current_user
    end

    render json: destination
  end
end
