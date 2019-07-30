Rails.application.routes.draw do
  resources :buyers
  resources :sellers
  resources :items
  resources :users
  resources :login, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
