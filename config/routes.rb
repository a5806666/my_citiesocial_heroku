Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'products#index'
  
  # 前台
  resources :products, only: [:index, :show] do
    get :search, on: :collection
  end

  # 前台 - 類別
  resources :categories, only: [:show] # categories/:id

  # 前台 - 購物車cart
  resource :cart, only: [:show, :destroy] do
    collection do
      get :checkout
    end    
  end

  # 前台 - 訂單
  resources :orders, except: [:new, :edit, :update, :destroy] do
    member do
      delete :cancel   #取消 /orders/8/cancel
      post :pay        #再付款 /orders/8/pay
      get :pay_confirm # /orders/8/pay_confirm
    end
    collection do
      get :confirm     #付款 /orders/confirm
    end
  end
  
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
