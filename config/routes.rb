Rails.application.routes.draw do
  resources :user_tracks
  get 'users/manage'

  get 'users/flag'

  root to: 'bibles#home'

  get 'users/manage', to: 'users#manage', as: 'manage_users'

  devise_for :users

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end

end
