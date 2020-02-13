Rails.application.routes.draw do
  devise_for :users
  resources :products, only:[:index,:show]
  root 'products#index'

  namespace :admin do
    root 'products#index'
    resources :products 
  end
end
