class CreateInfluencerStoresProducts < ActiveRecord::Migration
  def change
    create_table :influencer_stores_products do |t|
      t.references :influencer_store, index: true
      t.references :product, index: true
      t.integer :status, default: 0
      t.datetime :proposal_date
      t.text :comment
      t.string :feed_url

      t.timestamps null: false
    end
  end
end
