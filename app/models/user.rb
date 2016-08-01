class User < ActiveRecord::Base
  rolify
  include Authority::UserAbilities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable#, :omniauthable, omniauth_providers: [:facebook]

  has_many :purchase_lists, dependent: :destroy

  def self.find_for_facebook_oauth(auth)
    user = where(email: auth["email"]).first_or_create do |user|
      user.provider = "facebook"
      user.social_uid = auth["id"]
      user.password = Devise.friendly_token[0,20]
      user.name = auth["name"]
      user.skip_confirmation!
    end

    user.provider = "facebook" if user.provider.blank?
    user.social_uid = auth["id"] if user.social_uid.blank?
    user.save
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
