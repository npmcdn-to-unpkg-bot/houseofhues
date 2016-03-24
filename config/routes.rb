Rails.application.routes.draw do
  devise_for :users

  root 'colors#index'

  resources :colors
  resources :rooms
  resources :users
  resources :looks, :except => :show do
    member do
      post 'upvote'
    end
  end

  get '/looks/search' => 'looks#search'
  get '/rooms', :path => '/looks/search'

  get ':id' => 'users#show', as: :user_profile
  get ':id/setting' => 'users#edit', as: :user_setting
  match ':id/setting' => 'users#update', via: [:put, :patch]

end
