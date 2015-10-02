Rails.application.routes.draw do
  get 'sessions/new'

  get 'admin/index'

  root to: "welcome#index"

  get '/welcome/checkout', to: "welcome#checkout"



end
