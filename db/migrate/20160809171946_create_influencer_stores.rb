class CreateInfluencerStores < ActiveRecord::Migration
  def change
    create_table :influencer_stores do |t|
      t.references :user, index: true
      t.string :url
      t.text :desc
      t.string :nickname
      t.integer :selling_point, default: 0
      t.integer :user_point, default: 0

      t.timestamps null: false
    end
  end
end
