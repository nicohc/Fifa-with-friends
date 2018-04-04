Rails.application.routes.draw do

  root 'home#index'
  resources :matches
  resources :teams
  resources :players

end
