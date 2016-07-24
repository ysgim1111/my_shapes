class CreatePurchaseLists < ActiveRecord::Migration
  def change
    create_table :purchase_lists do |t|
      t.belongs_to :user, index: true
      t.string :order_number, null: false, default: ''
      t.timestamps null: false
    end
  end
end
