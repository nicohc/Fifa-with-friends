Rails.application.routes.draw do

  root 'home#index'
  get '/touslesmatchs', to: 'home#all_matches', as: 'all_matches'
  get '/touslesclubs', to: 'clubs#all_clubs', as: 'all_clubs'
  get '/classement', to: 'home#leaderboard', as: 'leaderboard'
  get '/randomiser', to: 'matches#randomiser', as: 'alea_match'

  resources :matches
  resources :teams
  resources :players
  resources :clubs
  resources :comments

  devise_for :users,
      path: '',
      controllers: {
         sessions: "users/sessions",
         registrations: "users/registrations" },
      path_names: {
        sign_in: 'login',
        sign_out: 'logout',
        sign_up: 'register',
        edit: 'settings',
      }

end
