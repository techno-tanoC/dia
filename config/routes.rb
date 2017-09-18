Rails.application.routes.draw do
  root to: "items#index"
  get "/search", to: "query#search"
  resources :items
  resources :rules
end
