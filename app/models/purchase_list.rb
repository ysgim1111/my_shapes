class PurchaseList < ActiveRecord::Base
  belongs_to :user

  has_one :purchase_result, dependent: :destroy
end
