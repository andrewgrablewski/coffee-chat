Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'
  resources :chatrooms
  get 'login',     to: "sessions#new"
  post 'login',    to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  get 'signup',    to: "users#new"
  resources :users, except: [:new]
  post 'signup',   to: "users#create"
  post 'message',  to: "messages#create"

  mount ActionCable.server, at: '/cable'

end
