Rails.application.routes.draw do
  get "/search", to: "static_pages#search"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static_pages#search"
end
