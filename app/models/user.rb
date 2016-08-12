class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable

  include Authority::UserAbilities

  rolify

  mount_uploader :image_profile, ProductBasicUploader

  has_one :influencer_store, dependent: :destroy

  has_many :purchase_lists, dependent: :destroy
  has_many :destinations, dependent: :destroy
  has_many :shopping_items, dependent: :destroy

  after_create :assign_default_role


  def self.find_with_update_or_create(auth)
    user = where(email: auth["email"])
    user.first_or_create do |user|
      user.provider = "facebook"
      user.social_uid = auth["id"]
      user.password = Devise.friendly_token[0,20]
      user.name = auth["name"]
      user.skip_confirmation!
    end.update_attributes(provider: "facebook", social_uid: auth["id"], name: auth["name"])
    user.first
  end


  private

  def assign_default_role
    self.add_role(:user) unless self.has_any_role?
  end
end
