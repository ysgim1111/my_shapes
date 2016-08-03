class User < ActiveRecord::Base
  rolify
  include Authority::UserAbilities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable#, :omniauthable, omniauth_providers: [:facebook]

  has_many :purchase_lists, dependent: :destroy
  has_many :destinations, dependent: :destroy
  has_many :shopping_items, dependent: :destroy

  def self.find_for_facebook_oauth(auth)
    user = where(provider: "facebook", social_uid: auth["id"]).first_or_create do |user|
      user.email = auth["email"]
      user.password = Devise.friendly_token[0,20]
      user.name = auth["name"]
      user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
