class AddPurchaseItemsCountToPurchaseLists < ActiveRecord::Migration
  def change
    add_column :purchase_lists, :purchase_items_count, :integer
  end
end
