class Product < ActiveRecord::Base
  include Authority::Abilities
  resourcify

  mount_uploader :image_basic, ProductBasicUploader
  mount_uploader :image_desc, ProductDescUploader

  enum view_type: [:regular, :main, :deal_upper, :deal]
  enum status: [:selling, :stop, :sellout, :close]

  default_scope -> { where(enable: true) }
  scope :disable, -> { where(enable: false) }

  has_many :influence_products
  has_many :influences, through: :influence_products
  has_many :product_options, dependent: :destroy
end
