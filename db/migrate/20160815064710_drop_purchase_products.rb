class DropPurchaseProducts < ActiveRecord::Migration
  def up
    drop_table :purchase_products
  end

  def down
    create_table :purchase_products do |t|
      t.belongs_to :purchase_list, index: true
      t.belongs_to :product, index: true
      t.timestamps null: false
    end
  end
end
