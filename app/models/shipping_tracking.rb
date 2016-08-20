class ShippingTracking < ActiveRecord::Base
  enum shipping_type: [:door]
  enum shipping_company: [:cj]

  belongs_to :trackable, polymorphic: true
end
