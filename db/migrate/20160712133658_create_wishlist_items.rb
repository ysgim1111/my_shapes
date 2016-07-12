class CreateWishlistItems < ActiveRecord::Migration
  def change
    create_table :wishlist_items do |t|
      t.belongs_to :product, index: true
      t.belongs_to :user, index: true
      t.integer :quantity, null: false, default: 1
      t.timestamps null: false
    end
  end
end
