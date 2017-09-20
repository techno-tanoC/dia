Rails.application.routes.draw do
  root to: "items#index"
  get "/menu", to: "query#menu"
  get "/tags", to: "query#tags"
  get "/search", to: "query#search"
  resources :items
  resources :rules
end
