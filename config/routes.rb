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
   # abrir html resetear password
    get 'reset_password' => 'sessions#reset_password'
    # reset coontraseña farmacia.
   post '/reset_password_update', to: 'sessions#reset_password_update'
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
    # ruta para farmacias verificadas
   get '/farmacias_verificadas', to: 'farmacia#farmacias_verificadas'  
    #busqueda de producto
  get '/producto/busqueda/:nombre', to: 'productos#busqueda'
  #busqueda de laboatorio
  get '/laboratorio/busqueda/:nombre', to: 'laboratorios#busqueda'
   #busqueda de plan paciente
  get '/plan_pacientes/busqueda/:nombre', to: 'plan_pacientes#busqueda'
  #busqueda de presentaciones
  get '/presentaciones/busqueda/:nombre', to: 'presentacions#busqueda'
  #busqueda de sustancias
  get '/sustancias/busqueda/:nombre', to: 'sustancia#busqueda'
  #busqueda de farmacias verificadas
  get '/farmacias_verificadas/busqueda/:nombre', to: 'farmacia#busquedaVerificadas'
  #busqueda de farmacias por Veriificar
  get '/farmacia/busqueda/:nombre', to: 'farmacia#busqueda'
  #busqueda de laboratorios que la farmacia va anadir
  post '/lab_fars/busqueda', to: 'lab_fars#busqueda'
  #busqueda de laboratorios que la farmacia va agrego
  post '/lab_fars/busquedaLaboratoriosAgregados', to: 'lab_fars#busquedaLaboratoriosAgregados'
  #busqueda de productos por agregar farmacia
  post '/pro_fars/busquedaProductos', to: 'pro_fars#showBusqueda'
  #busqueda de productos farmacia tiene agregado
  post '/pro_fars/pro_farmBusqueda', to: 'pro_fars#pro_farmBusqueda'

  # actualizar activo laboratorio
   put '/laboratorio_activo/:id', to: 'laboratorios#activo_update'
   # actualizar activo plan paciente
   put '/planpaciente_activo/:id', to: 'plan_pacientes#activo_update'
   # actualizar activo presentacion
   put '/presentacion_activo/:id', to: 'presentacions#activo_update'
   # actualizar activo sustancia
   put '/sustancia_activo/:id', to: 'sustancia#activo_update'
   # actualizar activo sustancia
   put '/producto_activo/:id', to: 'productos#activo_update'

   # ruta para que la farmacia vea la lista de requisitos del plan paciente
   get '/farmacia_plan_paciente/:id', to: 'plan_pacientes#farmacia_plan_paciente'
   # ruta para encontrar el plan paciente de un laboratorio
   get '/plan_paciente/:id', to: 'productos#Plan_Paciente'

     

   root 'sessions#logout'


   # RUTAS PARA EL API ******farmacias_cercanas
   namespace :api do
    namespace :v1 do
      get '/laboratorio_consulta', to: 'consultas#index'
      get '/farmacias_cercanas', to: 'consultas#FarmaciasCercanas'
      get '/infoFarmacia/:id', to: 'consultas#InfoFarmacia'
      get '/searchProducto/:nombre', to: 'consultas#SearchProducto'
      get '/infoProducto/:id', to: 'consultas#InfoProducto'
      get '/infoPlanPaciente/:id', to: 'consultas#InfoPlanPaciente'
      get '/FarmaciasCercanaSearch/:id', to: 'consultas#FarmaciasCercanaSearch'
      get '/FarmaciaProductoSearch/:id', to: 'consultas#infoFarmaciaProducto'
    end
  end




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
