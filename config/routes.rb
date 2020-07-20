Rails.application.routes.draw do

  resources :tickets
  resources :projects
  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login'  => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  resources :users


end
