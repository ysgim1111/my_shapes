Rails.application.routes.draw do
  devise_for :users do

    get :facebook_login, to: 'devise/sessions#facebook_login', as: :facebook_login
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
    get :sign_up_before, on: :collection
    get :sign_up_complete, on: :collection
    get :purchases_ready_test, on: :collection
    get :purchases_ready_test_mb, on: :collection
    post :email_send, on: :collection
  end
end
