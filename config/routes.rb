Rails.application.routes.draw do

  # resources :superuserslugs
  root to: "welcome#index"

  get '/purchases', to: "purchases#index"

  get '/purchases/new', to: "purchases#new" # new purchase form
  get '/purchases/:id/edit', to: "purchases#edit" # edit a purchase form

  get '/purchases/:id', to: "purchases#show", as: "purchase"

  get "/login", to: "sessions#new"

  post "/sessions", to: "sessions#create"

  post "/sign_out", to: "sessions#destroy"

  post "/purchases", to: "purchases#create"

  patch "/purchases/:id", to: "purchases#update", as: "update_purchase" # submit my edits

  # resources :charges


  # resources :purchases

end
#     Prefix Verb   URI Pattern                 Controller#Action
#             root GET    /                           welcome#index
# welcome_checkout GET    /welcome/checkout(.:format) welcome#checkout
#                  GET    /superuser/:id(.:format)    superuser#show
#        superuser GET    /superuser(.:format)        sessions#new
#         sessions POST   /sessions(.:format)         sessions#create
#         sign_out GET    /sign_out(.:format)         sessions#destroy
#          charges GET    /charges(.:format)          charges#index
#                  POST   /charges(.:format)          charges#create
#       new_charge GET    /charges/new(.:format)      charges#new
#      edit_charge GET    /charges/:id/edit(.:format) charges#edit
#           charge GET    /charges/:id(.:format)      charges#show
#                  PATCH  /charges/:id(.:format)      charges#update
#                  PUT    /charges/:id(.:format)      charges#update
#                  DELETE /charges/:id(.:format)      charges#destroy
#         purchase GET    /purchases/:id(.:format)    purchases#show
