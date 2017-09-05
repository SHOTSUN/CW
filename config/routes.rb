Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  resources  :projects
  resources  :users
  root "projects#index"

end
