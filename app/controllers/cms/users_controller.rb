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
    User.find(params[:id]).update_attributes(user_update_params)

    redirect_to action: :show
  end

  def destroy
    User.find(params[:id]).destroy

    redirect_to action: :index
  end


  private

  def user_update_params
    params.require(:user).permit(:name)
  end

  def user_create_params
    params.require(:user).permit(:name, :email, :password)
  end
end
