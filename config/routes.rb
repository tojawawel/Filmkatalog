Rails.application.routes.draw do
  get 'favourites/update'
  get 'favourites', to: 'favourites#index'
  devise_for :users
  root 'movies#index'
  resources :movies do
    resources :comments, module: :movies
  end
  resources :genres
  resources :movie_searches
end
