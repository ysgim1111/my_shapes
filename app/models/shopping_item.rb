class ShoppingItem < ActiveRecord::Base
  resourcify
  include Authority::Abilities

  belongs_to :product
  belongs_to :user
end
