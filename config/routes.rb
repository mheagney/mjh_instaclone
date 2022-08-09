Rails.application.routes.draw do
  resources :posts, only: [:create, :new] do
    resources :likes, only: :create do
      collection do
        delete :destroy
      end
    end
  end
  devise_for :users
  root "site#index"
end
