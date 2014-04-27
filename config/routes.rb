PLZKI::Application.routes.draw do
  match "/auth/:provider/callback", to:"sessions#create", via:[:get, :post]

  resources :tasks,    only: [:create, :new, :index]

  get "logout", to:"sessions#destroy"
 
  root 'home#index'
end
