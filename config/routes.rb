Rails.application.routes.draw do
  devise_for :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  #concern :paginatable do
  #  get '(page/:page)', :action => :index, :on => :collection, :as => ''
  #end
  
  # It has to find the tags.json or in my case /beats/tags.json
  #get "beats/tags" => "beats#tags", :as => :tags
  
  resources :users do
    resources :favorites
  end
  
  resources :beats do #, :concerns => :paginatable do
    resources :comments
    #post 'sort', on: :collection
    get 'download', on: :member
    get 'tags', on: :collection
  end
  
  # You can have the root of your site routed with "root"
  root 'beats#index'
  
  # In this case, you can use a singular resource to map /profile (rather than /profile/:id) to the show action
  # get 'profile', to: 'users#show'
  
  # Passing a String to get will expect a controller#action format, while passing a Symbol will map directly to an action:
  # get 'profile', to: :show

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

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
