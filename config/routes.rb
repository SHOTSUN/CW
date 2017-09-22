Rails.application.routes.draw do
  root to: "home#index"

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks"}


  get 'home/index'
  get '/profile' => "users#show", as: :user_root

  get 'users/show'

  resources :project, only: [:index, :create]
  get 'projects/show'
  post 'projects/new'
  root 'projects#new'

  scope ":locale" do
    resources :projects do
      resources :comments
      resources :donations
      member do
        get :dest
      end
    end
  end


end
