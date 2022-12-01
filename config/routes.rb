Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  devise_for :users
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  root to: "meets#new"

  resources :meets do
    resources :businesses, only: %i[index show]
  end

end
