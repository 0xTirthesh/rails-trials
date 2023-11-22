Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "pages#home"
  get "/about-us", to: "pages#about_us"

  # user
  post "/users", to: "users#create"
  get "/dashboard", to: "users#dashboard"

  # session
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
end
