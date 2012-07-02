Treefinger::Application.routes.draw do

  root :to => "ui#index"

  match "ui(/:action)", controller: "ui"

end

