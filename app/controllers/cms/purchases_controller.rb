class Cms::PurchasesController < BaseCmsController
  def index
    if current_user.is_admin?
      purchase_items = PurchaseItem.all
    else
      purchase_items = current_user.purchase_items
    end

    @purchase_lists = purchase_items
      .joins(:product, purchase_list: [:user, :destination])
      .joins("left outer join shipping_trackings on shipping_trackings.trackable_id = purchase_items.id and shipping_trackings.trackable_type = 'PurchaseItem'")
      .select("products.name products_name,
      purchase_items.id purchase_item_id, purchase_items.quantity, purchase_items.status, purchase_items.confirm_date, purchase_items.option,
      purchase_lists.id purchase_list_id, purchase_lists.created_at purchase_date,
      destinations.address, destinations.address_detail, destinations.receiver, destinations.phone_number,
      users.nickname, users.email,
      shipping_trackings.number tracking_number")
  end

  def status
    purchase_item = PurchaseItem.find(params[:purchase_id])
    purchase_item.status = params[:status]

    if purchase_item.shipping_tracking
      purchase_item.shipping_tracking.number = params[:tracking_number]
    else
      purchase_item.shipping_tracking = ShippingTracking.new(number: params[:tracking_number])
    end

    purchase_item.save

    render json: purchase_item
  end

  def samples
    if current_user.is_admin?
      products = Product.all
    else
      products = current_user.products
    end

    @samples =
      products
        .joins(influencer_stores_products: :destination, influencer_stores: :user)
        .joins("left outer join product_options po on po.product_id = products.id")
      .select("products.name, products.price, products.seller_product_code, products.image_basic
        , influencer_stores_products.status influencer_stores_product_status, influencer_stores_products.updated_at, influencer_stores_products.id influencer_stores_product_id
        , po.id option_id, po.name option_name
        , destinations.receiver, destinations.phone_number
        , users.email")
  end
end
