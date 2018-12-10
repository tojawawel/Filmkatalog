Rails.application.routes.draw do
  root 'movies#index'
  resources :movies do
    resources :comments
  end
  resources :genres
end
