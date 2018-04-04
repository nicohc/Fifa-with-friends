Rails.application.routes.draw do

  root 'home#index'
  resources :matches
  resources :players
end
