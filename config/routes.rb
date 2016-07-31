Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'facebook' => 'users/socials#facebook'
  end

  root 'products#index'

  resources :influences, :orders, :shopping_items, :wishlist_items

  resources :purchases do
    get :ready, on: :collection
  end

  resources :products do
    get :about, on: :collection
    get :recruit, on: :collection
    get :complete, on: :collection
    get :purchases_ready, on: :collection
    get :purchases_complete, on: :collection
    post :email_send, on: :collection
  end
end
