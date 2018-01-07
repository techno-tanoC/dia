# == Route Map
#
#    Prefix Verb   URI Pattern               Controller#Action
#      root GET    /                         items#index
#      menu GET    /menu(.:format)           query#menu
#      tags GET    /tags(.:format)           query#tags
#    search GET    /search(.:format)         query#search
#     items GET    /items(.:format)          items#index
#           POST   /items(.:format)          items#create
#  new_item GET    /items/new(.:format)      items#new
# edit_item GET    /items/:id/edit(.:format) items#edit
#      item GET    /items/:id(.:format)      items#show
#           PATCH  /items/:id(.:format)      items#update
#           PUT    /items/:id(.:format)      items#update
#           DELETE /items/:id(.:format)      items#destroy
#     rules GET    /rules(.:format)          rules#index
#           POST   /rules(.:format)          rules#create
#  new_rule GET    /rules/new(.:format)      rules#new
# edit_rule GET    /rules/:id/edit(.:format) rules#edit
#      rule GET    /rules/:id(.:format)      rules#show
#           PATCH  /rules/:id(.:format)      rules#update
#           PUT    /rules/:id(.:format)      rules#update
#           DELETE /rules/:id(.:format)      rules#destroy
#

Rails.application.routes.draw do
  root to: "items#index"
  get "/menu", to: "query#menu"
  get "/tags", to: "query#tags"
  get "/search", to: "query#search"
  resources :items
  resources :rules
end
