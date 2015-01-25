Rails.application.routes.draw do

  resources :support_requests

  resources :carts
  resources :orders
  resources :products
  resources :customers
  resources :addresses
  
  resources :payment_methods do
    get 'checkout/billing', on: :new
  end

  devise_for :users,
             controllers: { registrations: 'registrations', sessions: 'sessions' }
  
  get 'cart', to: 'carts#show', as: :customer_cart
  get 'profile', to: 'customers#show', as: :profile
  
  post 'add_product_to_cart', to: 'products#add_product_to_cart', as: :add_product_to_cart
  post 'increase_quantity', to: 'carts#increase_quantity', as: :increase_quanity
  post 'decrease_quantity', to: 'carts#decrease_quantity', as: :descrease_quantity
  post 'add_plan_to_cart', to: 'products#add_plan_to_cart', as: :add_plan_to_cart
  post 'remove_plan_from_cart', to: 'products#remove_plan_from_cart', as: :remove_plan_from_cart
  post 'checkout', to: 'carts#checkout', as: :checkout
  
  post '/address_update', to: 'addresses#address_update', as: 'address_update'
  post '/billing_update', to: 'payment_methods#billing_update', as: 'billing_update'
  post '/create_order', to: 'orders#create_order', as: 'create_order'
  
  get 'checkout/address', to: 'carts#address_step', as: :address_step
  get 'checkout/billing', to: 'carts#billing_step', as: :billing_step
  get 'checkout/review', to: 'carts#review_step', as: :review_step
  
  get 'about', to: 'pages#about', as: :about
  get 'recipes', to: 'pages#recipes', as: :recipes
  get 'earn_credit', to: 'pages#earn_credit', as: :earn_credit
  get 'faq', to: 'pages#faq', as: :faq
  
  ActiveAdmin.routes(self)
  
  root to: "pages#homepage"

end
