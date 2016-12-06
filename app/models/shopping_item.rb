class ShoppingItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  def self.find_and_update(product_id, user)
    shopping_item = user.shopping_items.where(product_id: product_id).first

    if shopping_item.present?
      shopping_item.update_attributes(quantity: shopping_item.quantity + 1)
    else
      shopping_item = ShoppingItem.create(user_id: user.id, product_id: product_id)
    end

    shopping_item
  end
end
