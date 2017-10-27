Rails.application.routes.draw do
  resources :genres
  resources :directors
  resources :actors
  scope 'movies' do
    get 'recently_movies', to: 'movies#recently_opened_movies_within_a_week'
    get 'add_to_watchlist', to: 'movies#add_to_watchlist'
  end
  resources :movies do
    resources :reviews
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'movies#index'
end
