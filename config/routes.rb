Rails.application.routes.draw do
  root "categories#index"
  resources :categories
  resources :questions, only: %i[create]
end
