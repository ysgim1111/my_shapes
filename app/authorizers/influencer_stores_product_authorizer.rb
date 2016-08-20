class InfluencerStoresProductAuthorizer < ApplicationAuthorizer
  def self.default(adjective, user)
    user.is_influencer? || user.is_admin?
  end

  def self.updatable_by(user)
    resource.product.can_update?(user) || user.is_influencer? || user.is_admin?
  end
end
