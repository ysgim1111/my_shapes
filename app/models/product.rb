class Product < ActiveRecord::Base
  default_scope -> { where(enable: true) }
  scope :disable, -> { where(enable: false) }

end
