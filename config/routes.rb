Rails.application.routes.draw do

  get 'seasons/new'

  get 'seasons/show'

  root 'home#index'
  get '/touslesmatchs', to: 'home#all_matches', as: 'all_matches'
  get '/touslesclubs', to: 'clubs#all_clubs', as: 'all_clubs'
  get '/allseasons', to: 'seasons#all_seasons', as: 'all_seasons'

  get '/classement', to: 'home#leaderboard', as: 'leaderboard'
  get '/randomiser', to: 'matches#randomiser', as: 'alea_match'

  resources :matches
  resources :tournaments
  get '/competitions', to: 'tournaments#all_tournaments', as: 'all_tournaments'
  get '/tournaments/:id/closed', to: 'tournaments#close_tournament', as: 'close_tournament'
  get '/tournaments/:id/opened', to: 'tournaments#open_tournament', as: 'open_tournament'
  get '/all_matches/maj', to: 'matches#maj_tournament_for_matches', as: 'maj_tournament'
  get '/competitions/maj', to: 'tournaments#migrate_all_existing_matches_to_last_season', as: 'maj_teams_season'
  get '/competitions/maj_stats', to: 'tournaments#migrate_all_player_stats_to_last_season_stats', as: 'maj_seasons_stats'

  resources :teams
  resources :players
  resources :clubs
  resources :comments
  resources :seasons

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
