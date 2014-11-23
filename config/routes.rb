Rails.application.routes.draw do

  resources :payment_methods, :only => [:new, :create]
  resources :carts
  resources :orders
  resources :products
  resources :customers

  devise_for :users,
             :controllers => { registrations: 'registrations', sessions: 'sessions' }
  
  get 'cart', to: 'carts#show', as: :customer_cart
  get 'profile', to: 'customers#show', as: :profile
  
  post 'add_product_to_cart', to: 'products#add_product_to_cart', as: :add_product_to_cart
  post 'increase_quantity', to: 'carts#increase_quantity', as: :increase_quanity
  post 'decrease_quantity', to: 'carts#decrease_quantity', as: :descrease_quantity
  post 'checkout', to: 'carts#checkout', as: :checkout
  
  get 'step_1', to: 'carts#step_1', as: :step_1
  get 'step_2', to: 'carts#step_2', as: :step_2
  
  ActiveAdmin.routes(self)
  
  root to: "homepage#index"

end
