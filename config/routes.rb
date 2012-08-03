Treefinger::Application.routes.draw do

  root :to => "pages#dashboard"

  match 'ui(/:action)', controller: 'ui'

  get '/sign_in', to: 'sessions#new', as: :sign_in
  get '/sign_up', to: 'users#new', as: :sign_up
  get '/sign_out', to: 'sessions#destroy', as: :sign_out

  post '/sign_in', to: 'sessions#create', as: :user_sign_in
  post '/sign_up', to: 'users#create', as: :user_sign_up

  resources :users, only: [:create]

  resources :projects, only: [:create, :show] do

    member do
      get 'complete'
      get 'incomplete'
      get 'all'
    end

    resources :tasks, only: [:destroy], controller: 'projects/tasks' do
      member do
        put 'complete'
      end
    end
  end

  match 'heartbeat', to: proc { [200, {}, ''.chars] }

end

