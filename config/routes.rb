Rails.application.routes.draw do

  root 'home#index'
  resources :matches

end
