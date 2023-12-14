Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :admin do
    resources :users
    resources :items
  end
  
  root "items#home"
  resources :items
  resources :addresses
  resources :order, only:[:index, :create]
  resource :cart
  resource :users

  get '/order/complete/:id', to: 'order#complete', as: 'order_complete'
  get '/order/history', to: 'order#history', as: 'order_history'
  get 'login', to: 'login#index', as: 'login_page'
  post 'login', to: 'login#create', as: 'login_action'
  post 'logout', to: 'login#destroy', as: 'logout'
end
