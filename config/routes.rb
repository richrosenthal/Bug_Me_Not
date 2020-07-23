Rails.application.routes.draw do

 get '/' => 'sessions#welcome'
 get '/login' => 'sessions#new'
 post '/login' => 'sessions#create'
 get '/signup' => 'users#new'
 post '/signup' => 'users#create'
 delete '/logout' => 'sessions#destroy'

 get '/auth/google_oauth2/callback' => 'sessions#omniauth'

  resources :updates
  resources :tickets do
   resources :updates, only: [:new, :index]  #website.com/tickets/1/updates/new <-nested route
  end
  resources :projects
  resources :users


end
