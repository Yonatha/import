Rails.application.routes.draw do
  root :to => "pessoas#importar"

  resources :pessoas do
    collection do
      post :processar
    end
  end
end
