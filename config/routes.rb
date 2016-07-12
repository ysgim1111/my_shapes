Rails.application.routes.draw do
  devise_for :users

  root 'products#index'

  resources :influences, :orders, :products, :shopping_items, :wishlist_items
end
