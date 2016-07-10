class Influence < ActiveRecord::Base
  has_many :influence_products
  has_many :products, through: :influence_products
end
