Rails.application.routes.draw do
  devise_for :users
  root 'movies#index'
  resources :movies do
    resources :comments
  end
  resources :genres
end
