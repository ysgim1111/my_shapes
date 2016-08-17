class PurchasesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @purchase_lists = current_user.purchase_lists
  end

  def show
    @purchase_list = PurchaseList.find(params[:id])
  end

  def new
    @purchase_list = current_user.purchase_lists.new(purchase_list_params)
    @purchase_list.purchase_items.new(purchase_item_params)
    @purchase_list.save
  end

  def create
    purchase_list = PurchaseList.find(params["merchant_uid"])
    purchase_list.status = "comeplete"
    purchase_list.user = current_user
    purchase_list.purchase_result = PurchaseResult.new(iamport_pg_param)
    purcahse_list.influencer_store.inrement!(:selling_point)
    purchase_list.save!

    render json: params
  rescue => e
    purcahse_list.update(status: "fail")
  end

  def complete
    @purchase_list = PurchaseList.find(params[:purchase_list_id])
  end

  def save_post
    address_book = AddressBook.update_or_create(params[:address_book_id], address_book_param, current_user)

    render json: address_book
  end


  private

  def purchase_list_params
    params.require(:purchase_list).permit(:influencer_store_id)
  end

  def purchase_item_params
    params.require(:purchase_item).permit(:quantity, :option, :product_id)
  end

  def iamport_pg_param
    params.permit("imp_uid", "pay_method", "name", "paid_amount", "pg_provider", "pg_tid", "apply_num", "buyer_name", "buyer_email", "buyer_tel", "buyer_addr", "buyer_postcode", "custom_data", "status", "paid_at", "receipt_url", "card_name", "card_quota")
  end

  def address_book_param
    params.permit(:receiver, :name, :phone_number, :zonecode, :address, :address_detail, :default)
  end
end
