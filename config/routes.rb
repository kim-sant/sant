Rails.application.routes.draw do

  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being the default of "spree"
  # mount Spree::Core::Engine, :at => '/'
        
  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being the default of "spree"
  
  root 'tabs#home'

  get '/home', to: 'tabs#home', as: 'home'
  get '/story', to: 'tabs#story', as: 'story'
  get '/recipes', to: 'tabs#recipes', as: 'recipes'
  get '/faq', to: 'tabs#faq', as: 'faq'
  get '/contact', to: 'tabs#contact', as: 'contact'
  get '/privacy', to: 'tabs#privacy', as: 'privacy'
  get '/sessions', to: 'tabs#sessions', as: 'sessions'
  get '/terms', to: 'tabs#terms', as: 'terms'
  get '/contactus', to: 'contact_requests#new', as: 'new_contact_request'

  get '/contact_requests', to: 'contact_requests#index', as: 'contact_requests'
  post '/contact_requests', to: 'contact_requests#create'
  get '/contact_requests/:id', to: 'contact_requests#show', as: 'contact_request'
  get '/contact_requests/:id/edit', to: 'contact_requests#edit', as: 'edit_contact_request'
  patch '/contact_requests/:id', to: 'contact_requests#update'
  put '/contact_requests/:id', to: 'contact_requests#update'
  delete '/contact_requests/:id', to: 'contact_requests#destroy'

  mount Spree::Core::Engine, :at => '/store'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

end
