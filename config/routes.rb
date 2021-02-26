Rails.application.routes.draw do
  resources :videos
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/video', to: 'videos#index'
  post '/video', to: 'dashboards#create'
  get '/rental', to: 'dashboards#rental'
  get '/customer', to: 'dashboards#customer'
  resources :users
end
