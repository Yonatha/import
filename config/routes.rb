Rails.application.routes.draw do
  root :to => "pessoas#importar"

  resources :pessoas
end
