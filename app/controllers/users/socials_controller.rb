class Users::SocialsController < Devise::RegistrationsController
  def facebook
    @user = User.find_with_update_or_create(params)

    if @user.persisted?
      sign_in @user, event: :authentication
      render js: "window.location = '#{session[:previous_url] || root_path}'"
      return
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
