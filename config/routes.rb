Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end 
  get '/new', to: "users#new_post"
  post '/new', to: "users#save_post"
  post '/addcomment/:id', to: "users#addcomment"
  get 'addlike/:id', to: "users#addlike"
  root 'users#index'
end
