Rails.application.routes.draw do
  
  root to: "welcome#index"

  get 'sessions/new'
  get 'admin/index'
  
end
