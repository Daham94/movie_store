Rails.application.routes.draw do
  resources :customers
  resources :videos
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/user_levels', to: 'user_levels#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/videos', to: 'dashboards#video'
  post '/video', to: 'videos#create'
  get '/rental', to: 'dashboards#rental'
  get '/customer', to: 'dashboards#customer'
  resources :users
end
