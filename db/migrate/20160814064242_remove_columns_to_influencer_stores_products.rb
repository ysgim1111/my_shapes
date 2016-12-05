class RemoveColumnsToInfluencerStoresProducts < ActiveRecord::Migration
  def up
    remove_column :influencer_stores_products, :receiver
    remove_column :influencer_stores_products, :zonecode
    remove_column :influencer_stores_products, :address
    remove_column :influencer_stores_products, :address_detail
    remove_column :influencer_stores_products, :phone_number
    remove_column :influencer_stores_products, :demand_message
  end

  def down
    add_column :influencer_stores_products, :receiver, :string
    add_column :influencer_stores_products, :zonecode, :integer
    add_column :influencer_stores_products, :address, :string
    add_column :influencer_stores_products, :address_detail, :string
    add_column :influencer_stores_products, :phone_number, :string
    add_column :influencer_stores_products, :demand_message, :string
  end
end
