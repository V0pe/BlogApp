Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :comments, only: [:new, :create]
  resources :likes, only: [:create]

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end
  root "users#index"
end
