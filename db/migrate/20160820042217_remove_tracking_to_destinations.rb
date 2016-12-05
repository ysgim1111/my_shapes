class RemoveTrackingToDestinations < ActiveRecord::Migration
  def change
    remove_column :destinations, :tracking_number, :string
    remove_column :destinations, :shipping_type, :integer
    remove_column :destinations, :shipping_company, :integer
    remove_column :destinations, :shipping_date, :date
  end
end
