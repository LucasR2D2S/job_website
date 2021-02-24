Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  get 'registration', to:'home#registration'
  
  resources :employees, only: [:index, :new, :create]

  resources :vacancies, only: [:index, :show, :new, :create] do
    member do
      get 'apply'
    end
  end

  resources :companies, only: [:index, :new, :create]

  resources :candidates, only: [:index, :show, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
