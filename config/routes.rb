Rails.application.routes.draw do

  root to: 'static_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]

  get 'roads/index'
  get 'roads/show'
  get 'roads/new'
  get 'roads/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end