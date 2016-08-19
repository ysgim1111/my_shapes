class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)

    redirect_to user_path
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update(user_password_params)
      flash[:notice] = t('devise.passwords.updated')
      bypass_sign_in @user
      redirect_to user_path
    else
      flash[:error] = @user.errors.full_messages
      render "show"
    end
  end


  private

  def user_params
    params[:user][:phone] = "#{params[:phone_number1]}-#{params[:phone_number2]}-#{params[:phone_number3]}"
    params.require(:user).permit(:nickname, :name, :image_profile, :phone)
  end

  def user_password_params
    params.require(:user).permit(:password, :password_confirmation, :reset_password_token)
  end
end
