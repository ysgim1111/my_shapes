class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable

  include Authority::UserAbilities

  rolify

  mount_uploader :image_profile, UserProfileUploader

  has_one :influencer_store, dependent: :destroy

  has_many :purchase_lists, dependent: :destroy
  has_many :wannabe_letters, through: :purchase_lists
  has_many :address_books, dependent: :destroy
  has_many :shopping_items, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :purchase_items, through: :products

  accepts_nested_attributes_for :roles, allow_destroy: true

  validates :nickname, length: { maximum: 20 }, presence: true, uniqueness: true

  def self.find_with_update_or_create(auth)
    user = where(email: auth["email"])
    user.first_or_create do |user|
      user.provider = "facebook"
      user.social_uid = auth["id"]
      user.password = Devise.friendly_token[0,20]
      user.nickname = auth["name"]
      user.skip_confirmation!
    end.update_attributes(provider: "facebook", social_uid: auth["id"], nickname: auth["name"])
    user.first
  end


  private

end
