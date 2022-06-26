Shop::Application.routes.draw do
  root :to => 'home#index'

  get 'home/index'
  get 'about/index'
  get 'contact/index'

  post 'add_to_basket/:product_id' => 'baskets#add_to_basket', :as => 'add_to_basket'

  resources :orders
  resources :products
  resources :baskets
  resources :order_positions
  resources :producers
  resources :categories
  resources :payment_methods
  resources :deliveries
  resources :addresses
  resources :countries

  devise_for :users, :controllers => { :sessions => 'sessions' }
end
