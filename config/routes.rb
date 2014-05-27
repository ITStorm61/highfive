TODOforME::Application.routes.draw do
  match "/auth/:provider/callback", to:"sessions#create", via:[:get, :post]
  match '/auth/failure' => 'sessions#failure'

  resources :tasks, only: [:create, :new, :index, :show, :destroy], param: :token do
    get 'take'    # Кто-то хочет взять задание
    get 'refuse'  # Отказаться от предложенного задания, когда оно еще не было взято
    get 'done'    # Кто-то выполнил задание
    get 'finish'  # Отдал награду
    get 'cancel'  # Отменить взятое задание
  end
  resource :profile,    only: [:show]
  get "logout", to:"sessions#destroy"
  get "friends", to: 'friends#index', as: 'friends'
  root 'home#index'
end
