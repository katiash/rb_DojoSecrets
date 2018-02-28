Rails.application.routes.draw do
# Root:
  root "sessions#new"
  
  get 'sessions/new' => "sessions#new"  #template
  post 'sessions/' => "sessions#create"
  delete 'sessions/:user_id' => "sessions#destroy"

  post 'likes' => "likes#create"
  delete 'likes' =>"likes#destroy", as: 'likes_path'

  get 'users/new' => "user#new" #template
  match 'users/:user_id' => "user#show", via: ['get'], as: 'user' # template: shows form for new secret
  post 'users/', to: "user#create"

  get 'secrets' => 'secrets#index' #re-route to secrets/index view
  get 'secrets/index' => "secrets#index" #template: all secrets 'show'
  delete 'secrets/:secret_id' => "secrets#destroy"  #if owner ONLY
  post 'secrets/' => "secrets#create"

  # Route Globbing:
  #match "*reset"=> redirect("/",  status: 302), via: [:all], as: 'glob', constraints: -> (req) { !(req.fullpath =~ /^\/rails\/.*/)}
  
  ## students controller:
  # resources :dojos, only: [:show] do
  #   resources :students, except: [:index, :create], controller: 'dojos/students'
  # end 
  # post 'students', to: 'dojos/students#create'
  # get '/dojos/:dojo_id/student/:id', to: 'dojos/students#profile'

  # CREATING CUSTOM URL HELPER (have to use "match"):
  # match 'surveys/result(/:id)' => "surveys#result", via: [:get], as: 'surveys_result'

  # get 'surveys/result' => 'surveys#result', :your_name => 'Your name', :dojo_loc => 'Mountain View, CA', :fave_lang => 'Python', :comment => 'No comment here...'
  # root 'surveys#index'
  # match "/:ind" => redirect("surveys/index"), via: [:all], constraints: { ind: /[a-z]+/ }
  
  # SEEMS LIKE FOLLOWING USED TO BE TRUE back in 2012:
  # match "/*id" => "pages#show", constraints: { id: /company/ } # doesn't work
  # match "/*id" => "pages#show", id: /company/ # does work
  
  # match "*path" => redirect("/", status: 301), via: [:all]
  # match "*path" to: redirect("/", status: 301), via: [:all]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
