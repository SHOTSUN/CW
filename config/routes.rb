Rails.application.routes.draw do
  get 'users/show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources  :projects
  resources  :users
  root "projects#index"
  root "projects#show"
end
