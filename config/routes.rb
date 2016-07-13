Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  get ':controller(/:action(/:id))'
  post ':controller(/:action(/:id))'

  root 'home#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'products#index'

  resources :influences, :orders, :products, :shopping_items, :wishlist_items
end
