Rails.application.routes.draw do
  root "subjects#index"
  resources :users
  resources :subjects do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
