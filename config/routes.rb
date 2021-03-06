Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :users, only: [:edit, :update, :show]
  resources :posts do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: :create
    resources :tags, only: :create
  end
end
