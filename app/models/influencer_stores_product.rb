class InfluencerStoresProduct < ActiveRecord::Base
  include Authority::Abilities
  resourcify

  mount_uploader :image_review, InfluencerReviewPhotoUploader

  enum status: [:proposal, :approved, :shipping, :apply_wating, :complete, :proposal_reject]

  scope :sellable, -> { where(status: InfluencerStoresProduct.statuses[:complete]) }

  belongs_to :influencer_store
  belongs_to :product

  has_one :destination, as: :deliverable
  has_one :shipping_tracking, as: :trackable, autosave: true
end
