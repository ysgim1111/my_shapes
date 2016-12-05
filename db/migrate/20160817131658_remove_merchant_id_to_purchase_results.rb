class RemoveMerchantIdToPurchaseResults < ActiveRecord::Migration
  def change
    remove_column :purchase_results, :merchant_uid, :string
  end
end
