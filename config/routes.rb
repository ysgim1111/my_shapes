Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'facebook' => 'users/socials#facebook'
  end

  root 'products#about'

  resources :influencer_stores, :shopping_items, :wishlist_items

  resources :purchases do
    collection do
      post :save_post
      get :complete
      get :user_info
      get :apply_product
    end
  end

  resources :products do
    get :about, on: :collection
    get :recruit, on: :collection
    get :complete, on: :collection
    get :sign_up_before, on: :collection
    get :sign_up_complete, on: :collection
    get :purchases_ready_test, on: :collection
    get :purchases_ready_test_mb, on: :collection
    post :email_send, on: :collection
    get :deal_detail, on: :collection
    get :show_test, on: :collection
  end

  namespace :cms do
    resources :products, :users

    resources :influencer_stores

    resources :influencer_stores_products do
      get :products, on: :collection
    end
  end

  get ':url', to: 'influencer_stores#mapping'
end
