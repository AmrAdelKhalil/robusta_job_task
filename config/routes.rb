Rails.application.routes.draw do
  scope 'movies' do
    get ':movie_id/add_to_watchlist', to: 'movies#add_to_watchlist'
    get 'recently_movies', to: 'movies#recently_opened_movies_within_a_week'
    post 'share', to: 'movies#share_movie'
    get 'my_watchlist', to: 'movies#my_watchlist'
  end
  resources :movies, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  authenticated :user do
    root to: 'movies#index', as: :authenticated_root
  end
  root 'static_pages#index'
end
