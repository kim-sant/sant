Rails.application.routes.draw do

  resources :payment_methods

  resources :carts

  resources :orders

  ActiveAdmin.routes(self)
  resources :products
  resources :profiles

  devise_for :users
  
  root to: "homepage#index"

end
