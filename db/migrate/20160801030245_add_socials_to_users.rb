class AddSocialsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :social_uid, :string
  end
end
