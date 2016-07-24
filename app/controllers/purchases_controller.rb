class PurchasesController < ApplicationController

  def index
    @purchase_lists = current_user.purchase_lists
  end

  def show
    @purchase_list = PurchaseList.find(params[:id])
  end

  def ready
    @shopping_items = ShoppingItem.where(user_id: current_user)
  end

  def create
    purchase_list = PurchaseList.new(order_number: params["merchant_uid"])
    purchase_list.user = current_user
    purchase_list.purchase_result = PurchaseResult.new(params)
    purchase_list.save

    render json: params
  end
end
