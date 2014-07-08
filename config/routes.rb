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
  match 'twilio/process_sms' => 'twilio#process_sms'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

resources :requests, only: [:index, :new, :create, :edit, :show, :update]
resources :needoptins, only: [:index, :new, :create, :edit, :show, :update, :destroy]

get 'messages/new' => 'messages#new'
get 'messages/confirmation' => 'messages#confirmation'
get 'meets' => "meets#new"
get 'meets/confirmation' => "meets#confirmation"
get 'activities' => "activities#index"

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
