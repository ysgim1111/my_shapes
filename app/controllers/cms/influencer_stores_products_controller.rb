class Cms::InfluencerStoresProductsController < BaseCmsController
  authorize_actions_for Product, actions: {products: :read}

  before_filter :redirect_to_index, only: [:new, :create]

  def products
    @products = Product
    @products = @products.where(name: params[:product_name]) if params[:product_name].present?
    @products = @products.where(seller_product_code: params[:seller_product_code]) if params[:seller_product_code].present?
    @products = @products.order(id: :desc)
  end

  def index
    @influencer_stores_products = current_user.influencer_store.influencer_stores_products
  end

  def new
    @influencer_stores_product = InfluencerStoresProduct.new(influencer_store_id: current_user.influencer_store, product_id: params[:product_id])
  end

  def create
    Destination.find(params[:destination_id]).update_attribute(:default, params[:set_default]) if params[:destination_id] && params[:set_default]

    influencer_stores_product = InfluencerStoresProduct.new(influencer_stores_product_params)
    influencer_stores_product.influencer_store = current_user.influencer_store
    influencer_stores_product.save
  end

  def edit
    @influencer_stores_product = InfluencerStoresProduct.find(params[:id])
  end

  def update
    InfluencerStoresProduct.find(params[:id]).update_attributes(influencer_stores_product_update_params)

    redirect_to action: :index
  end


  private

  def redirect_to_index
    if InfluencerStoresProduct.where(influencer_store_id: current_user.influencer_store, product_id: params[:product_id]).present?
      redirect_to action: :index
      return
    end
  end

  def influencer_stores_product_params
    params["phone_number"] = "#{params[:phone_number1]}-#{params[:phone_number2]}-#{params[:phone_number3]}"

    params.permit(:product_id, :receiver, :address, :address_detail, :phone_number, :zonecode, :demand_message)
  end

  def influencer_stores_product_update_params
    params.require(:influencer_stores_product).permit(:comment, :feed_url, :image_review)
  end
end
