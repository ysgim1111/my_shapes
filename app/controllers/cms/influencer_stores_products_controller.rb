class Cms::InfluencerStoresProductsController < BaseCmsController
  authorize_actions_for InfluencerStoresProduct, actions: {products: :read, complete: :read, update_complete: :read, info_apply: :read}

  before_filter :redirect_to_index, only: [:new, :create]

  def products
    @products = Product
    @products = @products.where(params[:search_type].to_sym => params[:search_input]) if params[:search_input].present?
    @products = @products.order(id: :desc)
  end

  def index
    @influencer_stores_products = current_user.influencer_store ? current_user.influencer_store.influencer_stores_products : []
  end

  def new
    @influencer_stores_product = InfluencerStoresProduct.new(influencer_store_id: current_user.influencer_store, product_id: params[:product_id])
  end

  def create
    AddressBook.find(params[:address_book][:id]).update_attribute(:default, params[:set_default]) if params[:address_book][:id] && params[:set_default]

    influencer_stores_product = InfluencerStoresProduct.new(influencer_stores_product_params)
    influencer_stores_product.influencer_store = current_user.influencer_store
    influencer_stores_product.destination = Destination.new(address_book_params)
    influencer_stores_product.save

    redirect_to action: :complete, id: influencer_stores_product.id
  end

  def complete
    @influencer_stores_product = InfluencerStoresProduct.find(params[:id])
  end

  def edit
    @influencer_stores_product = InfluencerStoresProduct.find(params[:id])
    @destination = @influencer_stores_product.destination
  end

  def update
    influencer_store_product = InfluencerStoresProduct.find(params[:id])
    influencer_store_product.update_attributes(influencer_stores_product_update_params)
    influencer_store_product.destination.update_attributes(destination_params) if influencer_store_product.destination

    redirect_to current_user.is_influencer? ? update_complete_cms_influencer_stores_products_path : samples_cms_purchases_path
  end

  def update_complete
  end

  def info_apply
  end


  private

  def redirect_to_index
    check_product = InfluencerStoresProduct.where(influencer_store_id: current_user.influencer_store, product_id: params[:product_id]).first

    if check_product.present?
      redirect_to action: :index
      return
    end
  end

  def influencer_stores_product_params
    params.permit(:product_id, :option)
  end

  def address_book_params
    params[:address_book][:phone_number] = "#{params[:address_book][:phone_number1]}-#{params[:address_book][:phone_number2]}-#{params[:address_book][:phone_number3]}"
    params.require(:address_book).permit(:receiver, :zonecode, :address, :address_detail, :address_type, :phone_number, :tel, :demand_message)
  end

  def influencer_stores_product_update_params
    params.require(:influencer_stores_product).permit(:comment, :feed_url, :image_review, :status)
  end

  def destination_params
    params[:destination][:shipping_date] = Date.current if params[:destination][:shipping_date].blank?
    params.require(:destination).permit(:tracking_number, :shipping_type, :shipping_company, :shipping_date)
  end
end
