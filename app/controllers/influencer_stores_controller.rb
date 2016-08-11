class InfluencerStoresController < ApplicationController
  def index
    @influencer_stores = InfluencerStore.limit(5)
    @new_influencer_stores = InfluencerStore.where.not(id: @influencer_stores.pluck(:id)).order(created_at: :desc)
    @products = Product.where(view_type: 1)
  end

  def show
    @influencer_store = InfluencerStore.find(params[:id])
    @influencer_stores_products = @influencer_store ? @influencer_store.influencer_stores_products : nil
    # @influencer_stores_products = @influencer_store.influencer_stores_products.where(status: InfluencerStoresProduct.statuses["complete"])
  end
end
