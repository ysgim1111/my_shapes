class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable

  include Authority::UserAbilities

  rolify

  has_many :purchase_lists, dependent: :destroy
  has_many :destinations, dependent: :destroy
  has_many :shopping_items, dependent: :destroy

  after_create :assign_default_role


  def self.find_for_facebook_oauth(auth)
    user = where(provider: "facebook", social_uid: auth["id"]).first_or_create do |user|
      user.email = auth["email"]
      user.password = Devise.friendly_token[0,20]
      user.name = auth["name"]
      user.skip_confirmation!
    end
  end


  private

  def assign_default_role
    self.add_role(:user) unless self.has_any_role?
  end
end
