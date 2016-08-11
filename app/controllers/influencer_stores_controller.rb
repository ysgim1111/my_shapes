class InfluencerStoresController < ApplicationController
  def index

  end

  def show
    @influencer_store = InfluencerStore.find(params[:id])
    @influencer_stores_products = @influencer_store ? @influencer_store.influencer_stores_products : nil
    # @influencer_stores_products = @influencer_store.influencer_stores_products.where(status: InfluencerStoresProduct.statuses["complete"])
  end
end
