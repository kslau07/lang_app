Rails.application.routes.draw do
  devise_for :users
  root "categories#index"
  resources :categories
  resources :questions, only: %i[create]
  resources :quizzes, only: %i[show new create]
  resources :experiments, only: %i[index]
  
  # get 'sign_up', to: 'devise/sessions#new'
  # get 'log_in', to: 'devise/sessions#new'
end
