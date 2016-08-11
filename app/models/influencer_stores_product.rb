class InfluencerStoresProduct < ActiveRecord::Base
  include Authority::Abilities
  resourcify

  mount_uploader :image_review, InfluencerReviewPhotoUploader

  enum status: [:proposal_waiting, :proposal_reject, :approved, :shipping, :shipping_complete, :apply_waiting, :complete]

  belongs_to :influencer_store
  belongs_to :product
end
