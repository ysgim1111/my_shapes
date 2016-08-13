class InfluencerStoreAuthorizer < ApplicationAuthorizer
  def self.default(adjective, user)
    user.is_influencer? || user.is_admin?
  end
end
