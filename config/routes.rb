Rails.application.routes.draw do
  devise_for :users

  resources :colors
  resources :rooms
  resources :looks
  resources :users

  post '/looks/:id', to: 'looks#findcrid'

  root 'colors#index'

end
