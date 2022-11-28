Rails.application.routes.draw do
  devise_for :users
  # change this to the meet new page
  root to: "meets#new"

  # root "articles#index"
  resources :meets do
    resources :businesses, only: %i[index show]
  end
end
