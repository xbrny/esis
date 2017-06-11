Rails.application.routes.draw do
  root "pages#index"
  get "about", to: "pages#about"

  resources :users

  resources :subjects do
    resources :comments
  end

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :departments

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
