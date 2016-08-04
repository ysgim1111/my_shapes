Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'facebook' => 'users/socials#facebook'
  end

  root 'products#index'

  resources :influences, :shopping_items, :wishlist_items

  resources :purchases do
    collection do
      post :save_post
      get :complete
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
end
