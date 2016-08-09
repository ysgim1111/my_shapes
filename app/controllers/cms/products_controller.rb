class Cms::ProductsController < BaseCmsController
  def index
    @products = Product.order(id: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)

    redirect_to action: :index
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    Product.find(params[:id]).update_attributes(product_params)

    redirect_to action: :show
  end

  def destroy
    Product.find(params[:id]).destroy

    redirect_to action: :index
  end


  private

  def product_params
    params.require(:product).permit(
      :name, :desc, :price, :view_type, :image_basic, :image_desc,
      :stack, :manufacturer, :brand, :made_in, :date_of_manufacturing,
      :use_by_date, :public_phrase, :minimum_purchase, :maximum_purchase,
      :seller_product_code, :sell_by_date, :status, :return_shipping_expenses,
      :exchange_shipping_expenses, :return_address, :as_tel, :as_info
    )
  end
end
