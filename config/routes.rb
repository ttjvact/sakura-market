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
  resources :users
  resources :addresses
  resources :order
  resource :cart

  get '/order/complete', to: 'order#complete', as: 'order_complete'
  get 'login', to: 'login#index', as: 'login_page'
  post 'login', to: 'login#create', as: 'login_action'
end
