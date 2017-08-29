Rails.application.routes.draw do

  root to: 'bibles#home'

  get 'users/manage', to: 'users#manage', as: 'manage_users'

  devise_for :users

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end

  resources :user_tracks

end
