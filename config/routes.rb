Rails.application.routes.draw do

  get 'bookmarks/create'
  get 'bookmarks/destroy'
  root to: 'static_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :posts do
    resources :comments, only: %i[create update destroy], shallow: true
    collection do
      get :bookmarks
    end
  end
  resources :bookmarks, only: %i[create destroy]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
