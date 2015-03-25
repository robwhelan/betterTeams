Rails.application.routes.draw do  
  
  resources :skill_assessments

  resources :value_assessments

  resources :companies

  resources :task_statements

  get 'pages/return_benchmark_data'
  get 'pages/my_job_postings'
  get 'pages/job_matches'
  get 'pages/user_dashboard'
  get 'pages/demo'
  get 'pages/add_user_to_dashboard'
  get 'pages/gap_analysis'
  
  resources :messages

  resources :job_postings

  resources :job_benchmarks

  resources :disc_assessments

  devise_for :users, controllers: { registrations: "users/registrations" } do
     get '/users/sign_out' => 'devise/sessions#destroy'
  end
   
  resources :pages
  root to: "disc_assessments#new"
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
