class AddStatusToPurchaseList < ActiveRecord::Migration
  def change
    add_column :purchase_lists, :status, :integer, null: false, default: 0
    add_reference :purchase_lists, :influencer_store, index: true
    remove_column :purchase_lists, :order_number, :string
  end
end
