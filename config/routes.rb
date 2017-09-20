Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'

  get '/profile' => "users#show", as: :user_root
  get '/pledge' => 'projects#pledgeForm', :as => :project_pledge

  get 'users/show'
  get 'projects/show'
  post 'projects/new'

  resources :project, only: [:index, :create]
  root to: "projects#index"


  devise_for :users, :controllers => { :omniauth_callbacks => 'callbacks'}

  scope ":locale" do

    resources :projects do
      resources :comments
      resources :donations
      member do
        get :dest
      end
    end

    resources  :users
    root "home#index"
    root "users#index"
    root "projects#index"
    root "projects#new"
  end


end
