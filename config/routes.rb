Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'products#index'
  
  resources :products, only: [:index, :show]

  # 後台
  namespace :admin do
    root 'products#index'
    resources :products
  end
end
