Rails.application.routes.draw do
  get 'measurements/new'
  devise_for :users
  root to: "phases#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :phases do
    resources :measurements, only: %i[new create]
  end

  resources :measurements, only: %i[edit update destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
