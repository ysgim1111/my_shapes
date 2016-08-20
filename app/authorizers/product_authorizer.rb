class ProductAuthorizer < ApplicationAuthorizer
  def self.default(adjective, user)
    user.is_seller? || user.is_admin?
  end

  def readable_by?(user)
    resource.user == user || user.is_admin?
  end

  def updatable_by?(user)
    resource.user == user || user.is_admin?
  end

  def deletable_by?(user)
    resource.user == user || user.is_admin?
  end
end
