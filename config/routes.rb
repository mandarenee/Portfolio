Rails.application.routes.draw do


  devise_for :users, path_names: {sign_in: "Sign In", sign_out: "Sign Out"},
                     controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :projects
  resources :categories, path: "obsessions_du_jour"
  resources :recipe_tags
  resources :recipes
  resources :subscribers
  resources :articles, path: "blog" do
    resources :comments
  end

  get 'hire-me' => 'professional#hire_me', as: :hire_me
  get 'about-me' => 'static_pages#about', as: :about_me
  get 'contact-me' => 'static_pages#contact', as: :contact_me

  root 'static_pages#welcome'
  get 'articles/index' => redirect('articles')
  get '', to: 'static_pages#welcome', as: :welcome

  # Sitemap
  get "/sitemap.xml" => "sitemap#index", format: "xml", as: :sitemap

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
