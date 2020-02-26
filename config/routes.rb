Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  devise_for :cocks, :controllers => {
    :registrations => 'cocks/registrations',
    :sessions => 'cocks/sessions'
  }

  devise_scope :cock do
    get "sign_in", :to => "cocks/sessions#new"
    get "sign_out", :to => "cocks/sessions#destroy"
  end

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
