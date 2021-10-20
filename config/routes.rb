Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/registration', to: 'users#new'
  resources :users, only: [:create]

  get '/dashboard', controller: :users, action: :show

  post '/dashboard', controller: :users, action: :find

  get '/discover', to: 'discovers#index'
  resources :movies
  resources :events
end
