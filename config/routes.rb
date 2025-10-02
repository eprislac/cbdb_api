Rails.application.routes.draw do
  resources :credits
  resources :covers
  resources :collections
  resources :users
  resources :by_lines
  resources :creators
  resources :copies
  resources :conditions
  resources :issues
  resources :publications
  resources :publication_types
  resources :publishers

  draw(:api)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "application#index"
end
