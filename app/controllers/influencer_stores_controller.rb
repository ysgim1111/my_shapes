class InfluencerStoresController < ApplicationController
  def index
    @influencer_stores = InfluencerStore.limit(5)
    @new_influencer_stores = InfluencerStore.where.not(id: @influencer_stores.pluck(:id)).order(created_at: :desc)
    @products = Product.where(view_type: 1)
  end

  def show
    @influencer_store = InfluencerStore.find(params[:id])
    @influencer_stores_products = @influencer_store ? @influencer_store.influencer_stores_products.sellable : []
  end

  def mapping
    if InfluencerStore.where(url: params[:url]).present?
      redirect_to influencer_store_path(InfluencerStore.where(url: params[:url]).first)
    else
      redirect_to root_path, flash: {error: "unknown url"}
    end
  end
end
