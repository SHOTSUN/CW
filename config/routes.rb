Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'

  get '/profile' => "users#show", as: :user_root

  get 'users/show'
  get 'projects/show'
  post 'projects/new'

  resources :project, only: [:index, :create]
  root to: "projects#index"


  devise_for :users, :controllers => { :omniauth_callbacks => 'callbacks'}
  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session2
    post 'signin', to: 'devise/sessions#create', as: :user_session2
    match 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session2, via: Devise.mappings[:user].sign_out_via
  end


  resources  :projects
  resources  :users
  root "home#index"
  root "users#index"
  root "projects#index"

  root "projects#new"

end
