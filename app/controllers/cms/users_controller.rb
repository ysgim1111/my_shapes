class Cms::UsersController < BaseCmsController
  def index
    @users = User.order(id: :desc)
  end

  def new
    @user = User.new
  end

  def create
    User.create(user_create_params) do |u|
      u.skip_confirmation!
    end

    redirect_to action: :index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(user_update_params)

    user.influencer_store = InfluencerStore.create(url: user.nickname) if user.is_influencer? && user.influencer_store.blank?

    redirect_to action: :show
  end

  def destroy
    User.find(params[:id]).destroy

    redirect_to action: :index
  end


  private

  def user_update_params
    params.require(:user).permit(:name, :nickname, :phone, :image_profile, roles_attributes: [:id, :name, :_destroy])
  end

  def user_create_params
    params.require(:user).permit(:nickname, :email, :password)
  end
end
