Rails.application.routes.draw do
  resources :pro_fars
  resources :disponibilidads
  resources :lab_fars
  resources :sessions
  resources :productos
  resources :nombres
  resources :presentacions
  resources :sustancia
  resources :tipo_plans
  resources :plan_pacientes
  resources :laboratorios
  resources :farmacia
  
   get 'logout' => 'sessions#logout'
   get 'login' => 'sessions#new'
   # ingresar vista cambio de contrasena
   get 'change_password' => 'sessions#new_password'
   # actualizar coontraseña farmacia.
   post '/change_password_update', to: 'sessions#update_contrasena'
   get 'lab_farmacia' => 'lab_fars#lab_farm'

   get '/pro_farmacia/:id', to: 'pro_fars#pro_farm'
   
   # ruta para editar productos farmacia
   get '/pro_farmacia_edit/:id', to: 'pro_fars#pro_farm_edit'
   # actualizar activo producto farmacia
   put '/pro_farmacia_update/:id', to: 'pro_fars#pro_farm_update'
   # actualizar verificado farmacia por parte del administrador
   put '/farmacia_verificado/:id', to: 'farmacia#update_verificado'
   

   root 'sessions#logout'
  # these routes are for showing users a login form, logging them in, and logging them out.

  

  

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
