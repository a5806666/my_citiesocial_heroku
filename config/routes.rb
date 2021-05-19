Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'products#index'
  
  # 前台
  resources :products, only: [:index, :show]
  resources :categories, only: [:show] # categories/:id

  # 後台
  namespace :admin do
    root 'products#index'
    resources :products, except: [:show]
    resources :vendors, except: [:show]
    resources :categories, except: [:show] do
      collection do
        put :sort # PUT /admin/categories/sort
      end
    end
  end

  
  # POST /api/v1/subscribe (email)
  namespace :api do
    namespace :v1 do
      # 訂閱
      post 'subscribe', to: 'utils#subscribe'
      post 'cart', to: 'utils#cart'
    end
  end
end
