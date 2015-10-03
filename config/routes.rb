Rails.application.routes.draw do
  get 'sessions/new'

  get 'admin/index'

  root to: "welcome#index"

  get '/checkout', to: "welcome#checkout"



end
