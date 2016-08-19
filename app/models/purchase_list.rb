class PurchaseList < ActiveRecord::Base
  enum status: ["결제준비", :ready, :complete, :fail, :cancel, :refund, :exchange]

  belongs_to :user
  belongs_to :influencer_store

  has_one :purchase_result, dependent: :destroy
  has_one :destination, dependent: :destroy, as: :deliverable
  has_many :purchase_items, dependent: :destroy
end
