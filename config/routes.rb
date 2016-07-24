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
    collection do
      get :about
      get :recruit
      get :complete
      post :email_send
    end

  end
end
