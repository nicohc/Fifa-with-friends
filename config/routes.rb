Rails.application.routes.draw do

  root 'home#index'
  get '/touslesmatchs', to: 'home#all_matches', as: 'all_matches'

  resources :matches
  resources :teams
  resources :players


end
