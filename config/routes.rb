Treefinger::Application.routes.draw do

  root :to => "pages#dashboard"

  match 'ui(/:action)', controller: 'ui'

  get '/sign_in', to: 'sessions#new', as: :sign_in
  get '/sign_up', to: 'users#new', as: :sign_up
  get '/sign_out', to: 'sessions#destroy', as: :sign_out

  post '/sign_in', to: 'sessions#create', as: :user_sign_in
  post '/sign_up', to: 'users#create', as: :user_sign_up

  post '/projects', to: 'projects#create', as: :projects

  resources :users, only: [:create]

end

