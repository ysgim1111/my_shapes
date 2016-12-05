class AddImageUrl2ToProducts < ActiveRecord::Migration
  def change
    add_column :products, :image_url2, :string
  end
end
