Rails.application.routes.draw do

  resources :payment_methods, :only => [:new, :create]
  resources :carts
  resources :orders
  resources :products
  resources :customers

  get '/cart', to: 'carts#show', as: :customer_cart
  get '/profile', to: 'customers#show', as: :profile
  post '/add_product_to_cart', to: 'products#add_product_to_cart', as: :add_product_to_cart
  post '/increase_quantity', to: 'carts#increase_quantity', as: :increase_quanity
  post '/decrease_quantity', to: 'carts#decrease_quantity', as: :descrease_quantity
  post '/checkout', to: 'carts#checkout', as: :checkout

  devise_for :users
  
  ActiveAdmin.routes(self)
  
  root to: "homepage#index"

end
