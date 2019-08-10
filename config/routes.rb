Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "user/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"
  get "portfolio", to: "users#portfolio"
  get "search_stocks", to: "stocks#search"
  get "search_references", to: "users#search"
  get "references", to: "users#references"
  resources :user_stocks, only: [:create, :destroy]
  resources :users, only: [:show]
  resources :connections, only: [:destroy, :create]
end
