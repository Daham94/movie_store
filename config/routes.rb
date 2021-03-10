Rails.application.routes.draw do

  get 'mails/index'
  get 'mails/send_mail'
  resources :users
  resources :inventories
  resources :customers
  resources :videos do
    collection do
      get 'search'
    end
    resources :reviews, except: [:show, :index]
  end
  resources :actors
  resources :genres
  resources :movie_stocks
  resources :customers_movie_stocks_users
  #resources :actor_videos
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/user_levels', to: 'user_levels#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/customer_login', to: 'customer_sessions#new'
  post '/customer_login', to: 'customer_sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
#  get '/videos', to: 'dashboards#video'
  post '/video', to: 'videos#create'
  post '/actors', to: 'actors#create'
  post '/actor_genders', to: 'actor_genders#create'
  post '/actor_countries', to: 'actor_countries#create'
  post '/content_ratings', to: 'content_ratings#create'
  post '/genres', to: 'genres#create'
  post '/media_types', to: 'media_types#create'
  #post '/actor_videos', to: 'videos#create'
  get '/rental', to: 'dashboards#rental'
  get :send_reminder_mail, to: 'mails#send_reminder_mail', as: :send_reminder_mail
  get :send_warning_mail, to: 'mails#send_warning_mail', as: :send_warning_mail

  get 'movie_stocks/index'
  get 'movie_stocks/new'
end
