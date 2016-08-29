class ReturnsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @purchase_lists = current_user.purchase_lists.where(status: [2, 5, 6])
  end

  def show
    @purchase_list = PurchaseList.find(params[:id])
  end

  def update
    purchase_list = PurchaseList.find(params[:id])
    purchase_items = purchase_list.purchase_items.where(id: params[:ids])
    purchase_items.each do |item|
      item.update(status: params[:status])
    end

    render json: purchase_items
  end
end
