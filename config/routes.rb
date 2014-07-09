Rails.application.routes.draw do

devise_for :users, controllers: { registrations: "users/registrations" }
resources :users, :only => [:index, :create, :new, :destroy]



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  get 'pages/about' => 'pages#about'
  get 'pages/contact' => 'pages#contact'

  root 'pages#home'

# root 'requests#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

#for twilio
  get 'twilio/process_sms' => 'twilio#process_sms'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

get '/requests/meet' => "requests#meet"
put '/requests' => "requests#update"
get '/messages/new' => 'messages#new'
get '/messages/confirmation' => 'messages#confirmation'

resources :requests, only: [:index, :new, :create, :show, :update]
resources :needoptins, only: [:index, :new, :create, :edit, :show, :update, :destroy]

end
