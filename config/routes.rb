Rails.application.routes.draw do
  
  get 'item_orders/create'

  get 'item_orders/update'

  get 'item_orders/destroy'

  # get 'pages/new'

  # get 'pages/destroy'

  # # post 'pages/update'

  # # post 'pages/create'

 #
 
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  

  # post 'stores/:id/items' => 'items#create'


  
  

  # get 'stores/create'

  # get 'stores/destroy'

  # get 'stores/update'

  # post 'users' => 'users#create'
  
  # get 'users/:id' => 'users#show'
   
   
   
   
# post 'stores' => 'stores#create'
   
  # get 'stores/:id'  => 'stores#show'
   
  # get "stores" => "stores#index"
  
 get 'stores/:id/about'  => 'stores#about'
   
   resources :stores,  only: [:show, :index ] do
     resources :items, only: [:create, :destroy , :show , :index , :edit ,:update]
     resources :links, only: [:create]
     resources :pages,  only: [:create, :update , :destroy]
     resources :item_orders, only: [:create, :update, :destroy, :show ]
     resources :orders, only: [:show, :create , :destroy ]
end


 get 'users/:user_id/stores/:id/customize' =>	'stores#customize' , as: 'stores_customize'
 
 
   # post 'users/:user_id/stores/:id/page' =>	'pages#create' , as: 'pages_create'
 
 
  get 'users/:user_id/stores/:id/additem' =>	'stores#additem' , as: 'stores_additem'



  resources :users, only: [:create, :destroy, :show] do
  
  resources :stores, only: [:create, :destroy, :show,  :new , :edit , :update]
end


get 'users/:user_id/try/:id/'   =>	'stores#try'


  # get 'users/destroy'

  # get 'welcome/main'
     # get 'welcome' => 'welcome#main'
   root 'welcome#main'
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
