class Destination < ActiveRecord::Base
  enum shipping_type: [:door]
  enum shipping_company: [:cj]

  belongs_to :deliverable, polymorphic: true
end
