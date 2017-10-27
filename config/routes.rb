Rails.application.routes.draw do
  resources :genres
  resources :directors
  resources :actors
  scope 'movies' do
    get 'recently_movies', to: 'movies#recently_opened_movies_within_a_week'
  end
  resources :movies
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'movies#index'
end
