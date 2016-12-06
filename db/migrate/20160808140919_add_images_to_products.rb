class AddImagesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :image_basic, :string
    add_column :products, :image_desc, :string
    add_column :products, :stack, :integer
    add_column :products, :manufacturer, :string
    add_column :products, :brand, :string
    add_column :products, :made_in, :string
    add_column :products, :date_of_manufacturing, :date
    add_column :products, :use_by_date, :date
    add_column :products, :public_phrase, :string
    add_column :products, :minimum_purchase, :integer
    add_column :products, :maximum_purchase, :integer
    add_column :products, :seller_product_code, :string
    add_column :products, :sell_by_date, :date
    add_column :products, :status, :integer
    add_column :products, :return_shipping_expenses, :integer
    add_column :products, :exchange_shipping_expenses, :integer
    add_column :products, :return_address, :string
    add_column :products, :as_tel, :string
    add_column :products, :as_info, :string

    remove_column :products, :image_url, :string
    remove_column :products, :image_url2, :string
  end
end
