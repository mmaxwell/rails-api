Rails.application.routes.draw do
  get "welcome/index"
  
  # resources gives us all the CRUD methods we need
  resources :items
  
  root "welcome#index"
end
