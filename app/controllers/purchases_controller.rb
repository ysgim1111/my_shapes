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
    purchase_list = PurchaseList.new(order_number: params["merchant_uid"])
    purchase_list.user = current_user
    purchase_list.purchase_result = PurchaseResult.new(result_param)
    purchase_list.save

    render json: params
  end

  def complete
    @product = Product.find(params[:product_id])
  end

  def save_post
    address_book = AddressBook.update_or_create(params[:address_book_id], address_book_param, current_user)

    render json: address_book
  end


  private

  def result_param
    params.permit("imp_uid", "pay_method", "merchant_uid", "name", "paid_amount", "pg_provider", "pg_tid", "apply_num", "buyer_name", "buyer_email", "buyer_tel", "buyer_addr", "buyer_postcode", "custom_data", "status", "paid_at", "receipt_url", "card_name", "card_quota")
  end

  def address_book_param
    params.permit(:receiver, :name, :phone_number, :zonecode, :address, :address_detail, :default)
  end
end
