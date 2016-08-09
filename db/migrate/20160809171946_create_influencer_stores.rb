class CreateInfluencerStores < ActiveRecord::Migration
  def change
    create_table :influencer_stores do |t|
      t.references :user, index: true
      t.string :url, :string
      t.text :desc
      t.integer :selling_point, default: 0
      t.integer :user_point, default: 0

      t.timestamps null: false
    end
  end
end
