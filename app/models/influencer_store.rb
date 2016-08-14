class InfluencerStore < ActiveRecord::Base
  include Authority::Abilities
  resourcify

  belongs_to :user

  has_many :influencer_stores_products, dependent: :destroy
  has_many :products, through: :influencer_stores_products
end
