class InfluenceProduct < ActiveRecord::Base
  belongs_to :influence, dependent: :destroy
  belongs_to :product, dependent: :destroy
end
