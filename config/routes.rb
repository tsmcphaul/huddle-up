Rails.application.routes.draw do

  root 'sessions#home'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :tasks

  resources :projects do 
    resources :tasks, only: [:new]
  end
  
  resources :users, only: [:new, :create] do
    resources :tasks, only: [:index, :show]
  end


end
