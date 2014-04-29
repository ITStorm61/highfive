PLZKI::Application.routes.draw do
  match "/auth/:provider/callback", to:"sessions#create", via:[:get, :post]

  resources :tasks,    only: [:create, :new, :index, :show]

  get "logout", to:"sessions#destroy"
 
  get "profiles/show"	

  root 'home#index'
end
