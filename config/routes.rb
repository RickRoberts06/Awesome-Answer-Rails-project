Rails.application.routes.draw do
  #this will match a GET request to "/hello"
  #thenit will invoke the WelcomeController  with hello action
  #VERB "URL" => "CONTROLLER_NAME#ACTION"
  get "/hello" => "welcome#hello"


#this will match any url that has /hello/ANYTHING to WelcomeController
#hello action. Rails will also add a key value to the params Hash from
#the URL. FOr instance if I go to: /hello/tam the params Hash will look like:
#
  get "/hello/:name" => "welcome#index",  as: "hello_person"

  get "/about" => "about#aboutindex"

  get "/contact" => "contact#index"

  get "/subscribe" => "subscribe#index"
  #This makes it that when we visit the home page of our application. It willl
  #invoke the welcome_controller with index action (method) inside it
  #notice the class name is WelcomeController but I only had to put welcome
  #in here as "controller" part is implied

  root "welcome#index"

  post "/contact" => "contact#create"

  post "/subscribe" => "subscribe#create"


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
