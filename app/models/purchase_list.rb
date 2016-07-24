class PurchaseList < ActiveRecord::Base
  belongs_to :users

  has_one :purchase_result, dependent: :destroy
end
