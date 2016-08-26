module PurchaseListsHelper
  def sum_purchase_price(purchase_list)
    purchase_list.purchase_items.inject(0){ |sum, item| sum += item.product.price }
  end

  def check_purchase_case(purchase_list)
    purchase_list.purchase_items.size > 1 ? " 외 #{purchase_list.purchase_items.size} 건" : ""
  end
end
