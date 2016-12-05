class AddShippingInfoToDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :shipping_type, :integer
    add_column :destinations, :shipping_company, :integer
    add_column :destinations, :shipping_date, :date
  end
end
