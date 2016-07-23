Rails.application.routes.draw do
  devise_for :users

  root 'products#index'

  resources :influences, :orders, :shopping_items, :wishlist_items

  resources :products do
    get :about, on: :collection
    get :recruit, on: :collection
    get :complete, on: :collection
    post :email_send, on: :collection
  end
end
