class RemoveNicknameToInfluencerStores < ActiveRecord::Migration
  def change
    remove_column :influencer_stores, :nickname
  end
end
