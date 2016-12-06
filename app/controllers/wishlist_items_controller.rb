class WishlistItemsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @wishlist = WishlistItem.where(user_id: 1)
  end

  def create
    wishlist_item = WishlistItem.new
    wishlist_item.user_id = 1
    wishlist_item.product_id = params[:product_id]
    wishlist_item.save

    render json: wishlist_item
  end

  def destroy
    wishlist_item = WishlistItem.destroy(params[:id])

    redirect_to :back
  end
end
