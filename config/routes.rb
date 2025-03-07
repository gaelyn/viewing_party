Rails.application.routes.draw do
  root 'welcome#index'

  get '/registration', to: 'users#new'
  # post '/registration', to: 'users#create'
  resources :users, only: [:create, :index]

  get '/dashboard', to: 'users#show'
  post '/dashboard', to: 'friendships#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/discover', to: 'discover#index'

  get '/movies', to: 'movies#index'
  get '/movies/:id', to: 'movies#show'

  get '/viewing-party/new', to: 'parties#new'
  post '/viewing-party/new', to: 'parties#create'
end
