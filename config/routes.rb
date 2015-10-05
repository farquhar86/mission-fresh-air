Rails.application.routes.draw do
  
  root to: "welcome#index"

  get '/welcome/checkout', to: "welcome#checkout"

  resources :charges

  resources :purchases, only: [:show]

end



     #     charges GET    /charges(.:format)          charges#index
     #             POST   /charges(.:format)          charges#create
     #  new_charge GET    /charges/new(.:format)      charges#new
     # edit_charge GET    /charges/:id/edit(.:format) charges#edit
     #      charge GET    /charges/:id(.:format)      charges#show
     #             PATCH  /charges/:id(.:format)      charges#update
     #             PUT    /charges/:id(.:format)      charges#update
     #             DELETE /charges/:id(.:format)      charges#destroy