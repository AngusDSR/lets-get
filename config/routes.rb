Rails.application.routes.draw do
  devise_for :users
  # change this to the meet new page
  root to: "meets#new"

  # Defines the root path route ("/")
  resources :businesses, only: %i[show]
  # root "articles#index"
  resources :meets do
    resources :businesses, only: %i[index]
  end
end
