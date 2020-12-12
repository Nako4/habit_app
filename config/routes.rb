Rails.application.routes.draw do
  get 'users/show'
  get 'users/new'
  resources :users, only: [:new, :create, :show]
  devise_for :users
  root to: 'articles#index'
  resources :articles
  get 'habits/:id', to: 'users#checked'
end
