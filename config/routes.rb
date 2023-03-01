Rails.application.routes.draw do
  
  root to: 'static_pages#top'

  get 'roads/index'
  get 'roads/show'
  get 'roads/new'
  get 'roads/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
