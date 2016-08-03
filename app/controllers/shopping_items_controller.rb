class ShoppingItemsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @shopping_items = ShoppingItem.where(user_id: current_user)
  end

  def create
    render json: ShoppingItem.find_and_update(params[:product_id, user])
  end

  def destroy
    shopping_item = ShoppingItem.destroy(params[:id])

    redirect_to :back
  end
end
