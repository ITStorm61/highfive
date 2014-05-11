PLZKI::Application.routes.draw do
  match "/auth/:provider/callback", to:"sessions#create", via:[:get, :post]

  resources :tasks,    only: [:create, :new, :index, :show, :destroy] do 
  	get "share"
  	put "update_status/:status", :action => "update_status", :as => "update_status"
  end
  resource :profile,    only: [:show]

  get "logout", to:"sessions#destroy"

  get "friends", to: 'friends#index', as: 'friends'
  

  root 'home#index'
end
