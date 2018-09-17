Rails.application.routes.draw do

  get 'seasons/new'

  get 'seasons/show'

  root 'home#index'
  get '/touslesmatchs', to: 'home#all_matches', as: 'all_matches'
  get '/touslesclubs', to: 'clubs#all_clubs', as: 'all_clubs'
  get '/classement', to: 'home#leaderboard', as: 'leaderboard'
  get '/randomiser', to: 'matches#randomiser', as: 'alea_match'

  resources :matches
  resources :tournaments
  get '/competitions', to: 'tournaments#all_tournaments', as: 'all_tournaments'
  get '/tournaments/:id/closed', to: 'tournaments#close_tournament', as: 'close_tournament'
  get '/tournaments/:id/opened', to: 'tournaments#open_tournament', as: 'open_tournament'

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
