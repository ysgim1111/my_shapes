class CreatePurchaseItems < ActiveRecord::Migration
  def change
    create_table :purchase_items do |t|
      t.references :purchase_list, index: true, null: false
      t.references :product, index: true, null: false
      t.integer :quantity, null: false, default: 1
      t.integer :status, null: false, default: 0
      t.string :option, null: false
      t.date :confirm_date

      t.timestamps null: false
    end
  end
end
