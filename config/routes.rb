Rails.application.routes.draw do
  resources :buyers
  resources :sellers
  resources :items
  resources :users
  resources :login, only: [:new, :create]
  get "/login", to: 'login#new', as: "login"
  post "/login", to: 'login#create'

  delete "/logout", to: 'login#destroy'

  root "login#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
