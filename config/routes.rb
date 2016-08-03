Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'facebook' => 'users/socials#facebook'
  end

  root 'products#index'

  resources :influences, :orders, :shopping_items, :wishlist_items

  resources :purchases do
    post :save_post, on: :collection
    get :complete, on: :collection
  end

  resources :products do
    get :about, on: :collection
    get :recruit, on: :collection
    get :complete, on: :collection
    get :sign_up_before, on: :collection
    get :sign_up_complete, on: :collection
    post :email_send, on: :collection
  end
end
