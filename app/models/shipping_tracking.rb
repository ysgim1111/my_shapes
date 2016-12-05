class ShippingTracking < ActiveRecord::Base
  enum shipping_type: [:door]
  enum shipping_company: [:post, :cj, :hanjin, :logen, :kgd, :hyundai, :kgy, :kgb]

  belongs_to :trackable, polymorphic: true
end
