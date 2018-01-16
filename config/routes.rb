Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: {format: 'json'} do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :campaigns do
        resources :subscribers, only: [:create]
      end
      resources :ingredients, only: [:index]
      resources :product_categories, only: [:index]
      resources :recipe_categories, only: [:index] do
        resources :recipes, only: [:index]
      end
      resources :recipes, only: [:index, :show] do
        collection do
          post :shopping_list
        end
      end
      resources :articles, only: [:index, :show]
      resources :products, only: [:index, :show] do
        collection do
          get :bundles
          get :menu
        end
      end
      resources :meals, only: [:index]
      resources :venues, only: [:index] do
        collection do
          get :search
        end
      end
      resources :carts, only: [:create, :show] do
        collection do
          post :checkout
          post :coupon
        end
      end
    end
  end

  namespace :admin do
    resources :venues
    resources :coupons
    resources :intakes
    resources :meals
    resources :restaurants
    resources :cooks
    resources :articles
    resources :products
    resources :tags
    resources :postcodes
    resources :product_categories
    resources :campaigns do
      resources :subscribers
    end
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

  namespace :user do
  end

  authenticated :admin do
    root 'admin/carts#index', as: :authenticated_admin
  end

  authenticated :user do
    root 'user#dashboard', as: :authenticated_user
  end

  devise_for :admins
  devise_for :users

  get 'users/dashboard', to: 'user#dashboard'
  get 'users/profile', to: 'user#profile', as: 'user_profile'

  root 'public#experience'
end
