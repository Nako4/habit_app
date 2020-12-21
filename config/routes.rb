Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  resources :users, only: [:create, :show]
  resources :articles, except: [:destroy]

  #users/showにアクセスしたときにusersコントローラーのcreateアクションを実行
  get 'users/show' => 'users#create'
  #users/showにpostしたときにusersコントローラーのcreateアクションを実行
  post 'users/show' => 'users#create'

  get 'search' => 'articles#search'
  get '/tags/:id' => "articles#tag_search", as: :tag_search

end
