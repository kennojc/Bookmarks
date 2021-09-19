Rails.application.routes.draw do
  resources :types
  resources :bookmarks
  resources :categories
  get 'data-categories' , to: 'categories#data_categories'

  root 'bookmarks#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end