class Cms::PurchasesController < BaseCmsController
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
