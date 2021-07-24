Rails.application.routes.draw do

  root 'sessions#home'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/users/:id/tasks', to: 'tasks#user_tasks_index', :as => 'user_tasks'
  get '/users/:id/tasks/new', to: 'tasks#new_user_task', :as => 'new_user_task'
  get '/mvp', to: "tasks#mvp"
  get '/tasks/unfinished', to: "tasks#unfinished"

  resources :tasks

  resources :projects do 
    resources :tasks, only: [:new]
  end

  resources :users, only: [:new, :create, :show, :index] do
    resources :tasks, only: [:new, :index, :show, :unfinished]
  end

  # get '/tasks/completed', to: "tasks#completed"
  
# get 'users/:user_id/tasks', to: 'tasks#index'

end
