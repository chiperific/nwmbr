Rails.application.routes.draw do

  resources :bookmarks
  resources :links
  root to: 'bibles#home'

  get 'users/manage', to: 'users#manage', as: 'manage_users'

  get '/search', to: 'bibles#search', as: 'search_bible', constraints: lambda { |req| req.format == :json }

  devise_for :users

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end

  resources :user_tracks

  get '*path', to: 'bibles#route_error'
end
