Rails.application.routes.draw do

  namespace(:admin){ resources :media_types }
  namespace(:admin){ resources :user_levels }
  namespace(:admin){ resources :genres }
  namespace(:admin){ resources :actors }
  namespace(:admin){ resources :actor_countries }
  namespace(:admin){ resources :actor_genders }
  namespace(:admin){ resources :content_ratings }
  namespace :admin do
    resources :users
    resources :customers
    resources :inventories
    resources :videos do
      collection do
        get 'search'
      end
      resources :reviews, except: [:show, :index]
    end
    resources :movie_stocks
    resources :customers_movie_stocks_users
    root 'sessions#new'
  end
  resources :customers
  resources :movie_stocks
  resources :customers_movie_stocks_users
  resources :videos do
    collection do
      get 'search'
    end
    resources :reviews, except: [:show, :index]
  end

  get '/signup', to: 'admin/users#new'
  post '/user_levels', to: 'admin/user_levels#create'
  get '/login', to: 'admin/sessions#new'
  post '/login', to: 'admin/sessions#create'
  delete '/admin_logout', to: 'admin/sessions#destroy'
  get '/admin_logout', to: 'admin/sessions#destroy'
#  get '/videos', to: 'dashboards#video'
  post '/video', to: 'admin/videos#create'
  #delete '/destroy_admin_video', to: 'admin/videos#destroy'
  post '/content_ratings', to: 'admin/content_ratings#create'
  post '/genres', to: 'admin/genres#create'
  post '/media_types', to: 'admin/media_types#create'
  #post '/actor_videos', to: 'videos#create'
  get '/rental', to: 'admin/dashboards#rental'
  get :send_reminder_mail, to: 'customers#send_reminder_mail', as: :send_reminder_mail
  get :send_warning_mail, to: 'admin/mails#send_warning_mail', as: :send_warning_mail

  get 'admin/mails/index'
  get 'admin/customers/mails/send_warning_mail'

  get 'admin/movie_stocks/index'
  get 'admin/movie_stocks/new'
  root 'static_pages#home'

  delete '/logout', to: 'customer_sessions#destroy'
  get '/logout', to: 'customer_sessions#destroy'
    #resources :actor_videos

  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  get '/customer_login', to: 'customer_sessions#new'
  post '/customer_login', to: 'customer_sessions#create'


end
