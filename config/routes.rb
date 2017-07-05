Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#index'

  get '/pages/secret' => 'pages#secret'


  get '/users' => 'users#index', as: :users

  get 'signup' => 'users#new', as: :new_user

  get 'users/:id' => 'users#show', as: :user

  post 'users' => 'users#create'

  get 'users/:id/edit' => 'users#edit', as: :edit_user

  patch 'users/:id' => 'users#update'




  get '/login' => 'sessions#new', as: :login

  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy', as: :logout



  # get '/posts' => 'posts#index', as: :posts
  #
  # get '/posts/new' => 'posts#new'
  #
  # post '/posts' => 'posts#create'
  #
  # get '/posts/:id' => 'posts#show', as: :post

resources :posts

end
