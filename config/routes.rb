Rails.application.routes.draw do
  devise_for :users
  root to: "phases#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :phases do
    resources :measurements
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
