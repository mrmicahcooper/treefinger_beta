Treefinger::Application.routes.draw do

  root :to => "pages#dashboard"

  match 'ui(/:action)', controller: 'ui'

  get '/sign_in', to: 'sessions#new', as: :sign_in
  get '/sign_out', to: 'sessions#destroy', as: :sign_out
  get '/sign_up', to: 'users#new', as: :sign_up
  post '/sign_up', to: 'users#create', as: :user_sign_up

  resources :sessions, only: :create
  resources :users, only: [:create]

end

