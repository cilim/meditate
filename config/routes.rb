Rails.application.routes.draw do
  resources :inline_validations, only: [:create]
end