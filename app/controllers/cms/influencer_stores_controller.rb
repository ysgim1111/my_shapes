class Cms::InfluencerStoresController < BaseCmsController
  def index
    @influencer_stores = InfluencerStore.order(id: :desc)
  end

  def new
    @influencer_store = InfluencerStore.new
  end

  def create
    current_user.influencer_store = InfluencerStore.new(influencer_store_params)

    redirect_to action: :index
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

    redirect_to action: :index
  end


  private

  def influencer_store_params
    params.require(:influencer_store).permit(:url, :desc)
  end
end
