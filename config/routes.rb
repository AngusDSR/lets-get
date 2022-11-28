Rails.application.routes.draw do
  devise_for :users
  root to: "meets#new"

  resources :meets do
    resources :businesses, only: %i[index show]
  end
end
