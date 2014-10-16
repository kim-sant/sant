Rails.application.routes.draw do

  resources :payment_methods, :only => [:new, :create]
  resources :carts
  resources :orders
  resources :products
  resources :customers

  get '/cart', to: 'customers#cart', as: :customer_cart
  post '/add_product_to_cart', to: 'products#add_product_to_cart', as: :add_product_to_cart
  post '/checkout', to: 'customers#checkout', as: :checkout

  devise_for :users
  
  ActiveAdmin.routes(self)
  
  root to: "homepage#index"

end
