class Destination < ActiveRecord::Base
  belongs_to :deliverable, polymorphic: true
end
