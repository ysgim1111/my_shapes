class CreateInfluencerStoresProducts < ActiveRecord::Migration
  def change
    create_table :influencer_stores_products do |t|
      t.references :influencer_store, index: true
      t.references :product, index: true
      t.string :receiver
      t.integer :zonecode
      t.string :address
      t.string :address_detail
      t.string :phone_number
      t.string :demand_message
      t.integer :status, default: 0
      t.datetime :proposal_date
      t.text :comment
      t.string :feed_url
      t.string :image_review

      t.timestamps null: false
    end
  end
end
