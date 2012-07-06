Treefinger::Application.routes.draw do

  root :to => "pages#dashboard"

  match 'ui(/:action)', controller: 'ui'

  get '/sign_in', to: 'sessions#new', as: :sign_in
  get '/sign_out', to: 'sessions#destroy', as: :sign_out

  resources :sessions, only: :create

end

