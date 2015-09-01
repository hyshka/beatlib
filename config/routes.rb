Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # devise
  devise_for :users
  #devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  devise_scope :user do
    get "login", to: "devise/sessions#new"
    get "logout", to: "devise/sessions#destroy"
    get "register", to: "devise/registrations#new"
    get "reset", to: "devise/passwords#new"
    get "password", to: "devise/passwords#edit"
    post "password", to: "devise/passwords#create"
    put "password", to: "devise/passwords#update"
    get "reconfirm", to: "devise/confirmations#new"
    post "confirmation", to: "devise/confirmations#create"
    get "confirmation", to: "devise/confirmations#show"
    get "/:permalink/edit", to: "devise/registrations#edit", as: "permalink_edit_user"
  end

  # users
  resources :users do
    resources :favorites
  end

  # beats
  resources :beats do #, :concerns => :paginatable do
    resources :comments
    #post 'sort', on: :collection
    get "download", on: :member
    get "tags", on: :collection
  end
  get "upload", to: "beats#new"
  get "popular", to: "beats#index", defaults: { sort: 'popular' }
  get "latest", to: "beats#index", defaults: { sort: 'latest' }

  # You can have the root of your site routed with "root"
  #root 'beats#index'

  # bump static pages up the priority stack
  #get '*id', to: 'high_voltage/pages#show', as: 'my_page', format: false
  get 'terms-of-service' => 'high_voltage/pages#show', id: 'terms-of-service'
  
  # lowest priority
  get "/:permalink", to: "users#show", as: "permalink_user"

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
