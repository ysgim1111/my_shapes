class InfluencerStoreAuthorizer < ApplicationAuthorizer
  def self.default(adjective, user)
    user.is_influencer? || user.is_admin?
  end

  def self.deletable_by?(user)
    user.is_admin?
  end
end
