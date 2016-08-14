class AddReferencesToDestinations < ActiveRecord::Migration
  def change
    add_reference :destinations, :deliverable, polymorphic: true, index: true
    add_column :destinations, :tracking_number, :string
    add_column :destinations, :demand_message, :string
    remove_reference :destinations, :user, index: true
    remove_column :destinations, :name, :string
  end
end
