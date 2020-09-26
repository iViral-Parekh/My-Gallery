Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :users, only: [:show]
  resources :albums, only: [:new, :create, :show]
  resources :photos, only: [:new, :create, :show]
end
