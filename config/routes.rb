Rails.application.routes.draw do
  resources :likes, only: [:create, :destroy]
  resources :posts, only: [:create, :new] do
    resources :comments, only: [:create, :new]
  end
  devise_for :users
  root "site#index"
end
