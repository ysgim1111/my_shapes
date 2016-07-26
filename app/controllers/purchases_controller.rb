class PurchasesController < ApplicationController

  def index
    @purchase_lists = current_user.purchase_lists
  end

  def show
    @purchase_list = PurchaseList.find(params[:id])
  end

  def ready
    # @shopping_items = ShoppingItem.where(user_id: current_user)
    @product = Product.find(params[:product_id])
    redirect_to "/products/purchases_ready"
  end

  def create
    # purchase_list = PurchaseList.new(order_number: params["merchant_uid"])
    # purchase_list.user_id = current_user.present? ? current_user.id : 1
    # purchase_list.purchase_result = PurchaseResult.new(params)
    # purchase_list.save

    render json: params
  end
end
