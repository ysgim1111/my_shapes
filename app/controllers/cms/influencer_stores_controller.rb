class Cms::InfluencerStoresController < BaseCmsController
  authorize_actions_for InfluencerStore
  authority_actions index: 'delete'

  def index
    @influencer_stores = InfluencerStore.order(:id)
  end

  def new
    @influencer_store = InfluencerStore.new
  end

  def create
    influencer_store = InfluencerStore.create(influencer_store_params)

    redirect_to current_user.is_admin? ? cms_influencer_stores_path : cms_influencer_store_path(influencer_store)
  end

  def show
    @influencer_store = InfluencerStore.find(params[:id])
  end

  def edit
    @influencer_store = InfluencerStore.find(params[:id])
  end

  def update
    InfluencerStore.find(params[:id]).update_attributes(influencer_store_params)

    redirect_to action: :show
  end

  def destroy
    InfluencerStore.find(params[:id]).destroy

    redirect_to new_cms_influencer_store_path
  end


  private

  def influencer_store_params
    params.require(:influencer_store).permit(:user_id, :url, :desc)
  end
end
