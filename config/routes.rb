Rails.application.routes.draw do
  devise_for :users
  # change this to the meet new page
  root to: "pages#home"

  # Defines the root path route ("/")
  # root "articles#index"
  resources :businesses, only: %i[index show]
  resources :meets
end
