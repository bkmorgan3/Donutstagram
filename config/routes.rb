Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/users' => 'users#index', as: :users

  get 'users/new' => 'users#new', as: :new_user

  get 'users/:id' => 'users#show', as: :user

  post 'users' => 'users#create'




  get '/login' => 'sessions#new', as: :login

  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy', as: :logout


  get '/posts' => 'posts#index'
end
