class Product < ActiveRecord::Base
  include Authority::Abilities
  resourcify

  mount_uploader :image_basic, ProductBasicUploader
  mount_uploader :image_desc, ProductDescUploader

  enum view_type: [:regular, :main, :deal_upper, :deal]
  enum status: [:selling, :stop, :sellout, :close]

  default_scope -> { where(enable: true) }
  scope :disable, -> { where(enable: false) }

  belongs_to :user

  has_many :influencer_stores_products
  has_many :influencer_stores, through: :influencer_stores_products
  has_many :product_options, dependent: :destroy
  has_many :purchase_items

  accepts_nested_attributes_for :product_options, allow_destroy: true
end
