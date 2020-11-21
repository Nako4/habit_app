Rails.application.routes.draw do
  root to: 'articles#index'
  resources only: :index
end
