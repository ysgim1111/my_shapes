class InfluencerStore < ActiveRecord::Base
  belongs_to :user

  has_many :influencer_stores_products, dependent: :destroy
  has_many :products, through: :influence_products
end
