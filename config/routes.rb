Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  resources :products
  resources :profiles

  devise_for :users
  
  root to: "homepage#index"

end
