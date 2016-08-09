class InfluencerStoresProduct < ActiveRecord::Base
  belongs_to :influencer_store
  belongs_to :product
end
