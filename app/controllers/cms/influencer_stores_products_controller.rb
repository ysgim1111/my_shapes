class Cms::InfluencerStoresProductsController < BaseCmsController
  authorize_actions_for InfluencerStoresProduct, actions: {products: :read, complete: :read, update_complete: :read, info_apply: :read, edit_shipping: :read, update_shipping: :update}

  def products
    @products = Product.sellable
    @products = @products.where(params[:search_type].to_sym => params[:search_input]) if params[:search_input].present?
    @products = @products.joins("left outer join influencer_stores_products on influencer_stores_products.product_id = products.id").where("`influencer_stores_products`.`influencer_store_id` IS NULL OR `influencer_stores_products`.`influencer_store_id` != ?", current_user.influencer_store).order(id: :desc)
  end

  def index
    @influencer_stores_products = current_user.is_admin? ? InfluencerStoresProduct.all :  current_user.influencer_store.influencer_stores_products
  end

  def new
    @influencer_stores_product = current_user.influencer_store.influencer_stores_products.new(product_id: params[:product_id])
  end

  def create
    AddressBook.find(params[:address_book][:id]).update_attribute(:default, params[:set_default]) if params[:address_book][:id].present? && params[:set_default].present?

    influencer_stores_product = InfluencerStoresProduct.new(create_params)
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
  end

  def update
    InfluencerStoresProduct.find(params[:id]).update_attributes(update_params)

    redirect_to update_complete_cms_influencer_stores_products_path
  end

  def edit_shipping
    @influencer_stores_product = InfluencerStoresProduct.find(params[:influencer_stores_product_id])
    @shipping_tracking = @influencer_stores_product.shipping_tracking
  end

  def update_shipping
    influencer_stores_product = InfluencerStoresProduct.find(params[:influencer_stores_product_id])
    influencer_stores_product.assign_attributes(update_params)

    if influencer_stores_product.shipping_tracking.blank?
      influencer_stores_product.shipping_tracking = ShippingTracking.new(shipping_tracking_params)
      influencer_stores_product.shipping_tracking.shipping_date = Date.current
    elsif params[:shipping_tracking].present?
      influencer_stores_product.shipping_tracking.assign_attributes(shipping_tracking_params)
    end

    influencer_stores_product.save

    redirect_to samples_cms_purchases_path
  end

  def update_complete
  end

  def info_apply
  end


  private

  def create_params
    params.permit(:product_id, :option)
  end

  def address_book_params
    params[:address_book][:phone_number] = "#{params[:address_book][:phone_number1]}-#{params[:address_book][:phone_number2]}-#{params[:address_book][:phone_number3]}"
    params.require(:address_book).permit(:receiver, :zonecode, :address, :address_detail, :address_type, :phone_number, :tel, :demand_message)
  end

  def update_params
    params.require(:influencer_stores_product).permit(:comment, :feed_url, :image_review, :status)
  end

  def shipping_tracking_params
    params.require(:shipping_tracking).permit(:number, :shipping_type, :shipping_company)
  end
end
