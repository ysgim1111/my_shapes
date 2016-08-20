class AddCardInfoToPurchaseResults < ActiveRecord::Migration
  def change
    add_column :purchase_results, :card_name, :string
    add_column :purchase_results, :card_quota, :string
  end
end
