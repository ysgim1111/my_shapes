class PurchaseItem < ActiveRecord::Base
  enum status: [:purchase, :shipping_ready, :shipping, :shipping_complete, :purchased]

  belongs_to :purchase_list
  belongs_to :product
end
