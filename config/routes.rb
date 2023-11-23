Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "pages#home"
  get "/about-us", to: "pages#about_us"

  # user
  post "/users", to: "users#create"
  get "/dashboard", to: "users#dashboard"
  get "/settings", to: "users#settings"
  patch "/passwords", to: "users#update_password"
  patch "/profiles", to: "users#update_profile"

  # session
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"


  # APIs
  get "/api/ping", to: "ping#index"

  Rails.application.routes.draw do
    namespace :api, defaults: {format: 'json'}do
      namespace :v1 do
        resources :todos
      end
    end
  end
end
