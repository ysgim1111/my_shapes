class AddOtherToProducts < ActiveRecord::Migration
  def change
    add_column :products, :discount, :integer
    add_column :products, :shipping_expenses, :integer
    add_column :products, :view_type, :integer, default: 0, null: false
  end
end
