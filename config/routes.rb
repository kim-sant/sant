Rails.application.routes.draw do

  resources :payment_methods, :only => [:new, :create]
  resources :carts
  resources :orders
  resources :products
  resources :customers
  
  post '/add_product_to_cart', :to => 'products#add_product_to_cart', as: :add_product_to_cart

  devise_for :users
  
  ActiveAdmin.routes(self)
  
  root to: "homepage#index"

end
