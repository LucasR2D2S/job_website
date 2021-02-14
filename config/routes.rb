Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  get 'registration', to:'home#registration'
  
  resources :employees, only: [:index, :new, :create]

  resources :vacancies, only: [:index, :new, :create]

  resources :companies, only: [:index, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
