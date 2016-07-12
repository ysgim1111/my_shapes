class ShoppingItemsController < ApplicationController
  def index
    @shopping_items = ShoppingItem.where(user_id: 1)
  end

  def create
    shopping_item = ShoppingItem.new
    shopping_item.user_id = 1
    shopping_item.product_id = params[:product_id]
    shopping_item.save

    render json: shopping_item
  end

  def destroy
    shopping_item = ShoppingItem.destroy(params[:id])

    redirect_to :back
  end
end
