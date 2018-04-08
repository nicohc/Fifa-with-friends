Rails.application.routes.draw do

  root 'home#index'
  get '/touslesmatchs', to: 'home#all_matches', as: 'all_matches'
  get '/classement', to: 'home#leaderboard', as: 'leaderboard'

  resources :matches
  resources :teams
  resources :players
  resources :clubs


end
