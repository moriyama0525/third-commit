Rails.application.routes.draw do
  devise_for :cocks
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
    resources :foods
    root to: "foods#index"
    get "/toppage", to:"foods#toppage"

    resources :users, only: :show

    get "/store/:id", to: "stores#show"
    post "/store/:id", to: "stores#create"
    get "/search", to: "foods#search"
    resources :cocks, only: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
