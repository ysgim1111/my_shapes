class AddOptionToInfluencerStoresProducts < ActiveRecord::Migration
  def change
    add_column :influencer_stores_products, :option, :string
  end
end
