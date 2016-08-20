class AddImageProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_profile, :string
  end
end
