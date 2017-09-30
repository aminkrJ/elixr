Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: {format: 'json'} do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :campaigns do
        resources :subscribers, only: [:create]
      end
      resources :ingredients, only: [:index]
      resources :recipe_categories, only: [:index] do
        resources :recipes, only: [:index]
      end
      resources :recipes, only: [:index, :show] do
        collection do
          post :shopping_list
        end
      end
      resources :articles, only: [:index, :show]
      resources :products, only: [:index, :show]
      resources :meals, only: [:index]
      resources :carts, only: [:create] do
        member do
          post :checkout
        end

        collection do
          post :coupon
        end
      end
    end
  end

  namespace :admin do
    resources :coupons
    resources :intakes
    resources :meals
    resources :restaurants
    resources :subscribers
    resources :cooks
    resources :articles
    resources :products
    resources :campaigns
    resources :tenants
    resources :users
    resources :recipe_categories
    resources :ingredient_categories
    get 'engine/dashboard'

    resources :recipes
    resources :carts do
      member do
        get :invoice
      end
    end
    resources :ingredients do
      member do
        get 'duplicate'
      end

      collection do
        post 'fetch'
      end
    end
    resources :nutrition_facts
    resources :units
  end

  authenticated :admin do
    root 'admin/units#index', as: :authenticated_admin
  end

  devise_for :admins
  devise_for :users

  root 'public#experience'

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
