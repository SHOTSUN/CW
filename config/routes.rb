Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'

  get 'users/show'


  devise_for :users
  resources  :projects
  resources  :users
  root "home#index"

end
