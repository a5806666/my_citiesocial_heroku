Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'products#index'
  
  # 前台
  resources :products, only: [:index, :show] do
    get :search, on: :collection
  end
  # 前台 - 購物車cart
  resource :cart, only: [:show, :destroy]
  # 前台 - 類別
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

  namespace :api do
    namespace :v1 do
      # 訂閱
      post 'subscribe', to: 'utils#subscribe' # POST /api/v1/subscribe (email)
      # 購物車
      post 'cart', to: 'utils#cart' # POST /api/v1/cart (購物車)
    end
  end
end
