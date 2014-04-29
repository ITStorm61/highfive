PLZKI::Application.routes.draw do
  match "/auth/:provider/callback", to:"sessions#create", via:[:get, :post]

  resources :tasks,    only: [:create, :new, :index, :show]
  resource :profile,    only: [:show]

  get "logout", to:"sessions#destroy"

  get "friends", to: 'tasks#index', as: 'friends'
  root 'home#index'
end
