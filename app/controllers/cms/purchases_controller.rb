class Cms::PurchasesController < BaseCmsController
  def index
    if current_user.is_admin?
      purchase_items = PurchaseItem.all
    else
      purchase_items = current_user.purchase_items
    end

    @purchase_items = purchase_items.joins(:destination, :product, purchase_list: :user).select("
      purchase_items.id, purchase_items.quantity, purchase_items.status, purchase_items.confirm_date, purchase_items.option,
      destinations.address, destinations.address_detail, destinations.receiver, destinations.phone_number, destinations.tracking_number,
      purchase_lists.id purchase_lists_id, purchase_lists.created_at purchase_date,
      users.nickname, users.email,
      products.name products_name
      ")
  end

  def status
    purchase_item = PurchaseItem.find(params[:purchase_id])
    purchase_item.status = params[:status]
    purchase_item.destination.update(tracking_number: params[:tracking_number])
    purchase_item.save

    render json: {message: "success"}
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
        , destinations.receiver, destinations.phone_number, destinations.tracking_number
        , users.email")
  end
end
