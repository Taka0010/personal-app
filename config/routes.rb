Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users
  
  resources :users, only: [:edit, :update, :show]
  resources :posts do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: :create
    resources :tags, only: :create
  end
end
