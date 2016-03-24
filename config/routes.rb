Rails.application.routes.draw do
  devise_for :users

  resources :colors
  resources :rooms, :except => :create
  resources :users
  resources :looks, :except => :show do
    member do
      post 'upvote'
    end
  end



  post '/looks/search' => 'looks#search'

  get ':id' => 'users#show', as: :user_profile
  get ':id/setting' => 'users#edit', as: :user_setting
  match ':id/setting' => 'users#update', via: [:put, :patch]

  root 'colors#index'

end
