Rails.application.routes.draw do
  resources :users
  resources :messages
  resources :rooms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  post "/create_user" => "home#create_user"
  get "/logout" => "home#logout"
  mount ActionCable.server, at: '/cable'
end
