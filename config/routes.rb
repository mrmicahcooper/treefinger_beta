Treefinger::Application.routes.draw do

  root :to => "pages#dashboard"

  match 'ui(/:action)', controller: 'ui'

  get '/sign_in', to: 'sessions#new', as: :sign_in

  resources :sessions, only: :create

end

