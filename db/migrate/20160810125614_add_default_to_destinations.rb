class AddDefaultToDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :default, :boolean, default: false
  end
end
