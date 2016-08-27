class PurchaseItem < ActiveRecord::Base
  enum status: [:purchase, :shipping_ready, :shipping, :shipping_complete, :purchased, :exchange, :return]

  belongs_to :purchase_list, counter_cache: true
  belongs_to :product

  has_one :shipping_tracking, as: :trackable, dependent: :destroy
end
