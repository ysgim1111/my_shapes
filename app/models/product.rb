class Product < ActiveRecord::Base
  enum view_type: [:regular, :main, :deal_upper, :deal]

  default_scope -> { where(enable: true) }
  scope :disable, -> { where(enable: false) }

  has_many :influence_products
  has_many :influences, through: :influence_products
end
