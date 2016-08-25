class Cms::ProductsController < BaseCmsController
  authorize_actions_for Product

  def index
    if current_user.is_admin?
      @products = Product.order(id: :desc)
    else
      @products = current_user.products.order(id: :desc)
    end

    authorize_action_for(@products)
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(create_params)

    redirect_to action: :index
  end

  def show
    @product = Product.find(params[:id])
    authorize_action_for(@product)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    Product.find(params[:id]).update_attributes(create_params)

    redirect_to action: :show
  end

  def destroy
    Product.find(params[:id]).destroy

    redirect_to action: :index
  end


  private

  def create_params
    params.require(:product).permit(
      :user_id, :name, :desc, :price, :view_type, :image_basic, :image_desc,
      :stack, :manufacturer, :brand, :made_in, :date_of_manufacturing,
      :use_by_date, :public_phrase, :minimum_purchase, :maximum_purchase,
      :seller_product_code, :sell_by_date, :status, :return_shipping_expenses,
      :exchange_shipping_expenses, :return_address, :as_tel, :as_info, :discount, :shipping_expenses,
      product_options_attributes: [:id, :name, :_destroy]
    )
  end
end
