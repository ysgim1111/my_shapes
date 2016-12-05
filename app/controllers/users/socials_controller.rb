class Users::SocialsController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook_oauth(params)

    ap "persisted? #{@user.persisted?}"

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      redirect_to new_user_registration_url
    end
  end

  protected

  def after_sign_up_path_for(resource)
    session[:previous_url] || root_path
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end
end
