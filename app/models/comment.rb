class Comment < ActiveRecord::Base
  has_many :replies
end
