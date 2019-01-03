Rails.application.routes.draw do
  root 'movies#index'
  devise_for :users
  get 'favourites/update'
  get 'favourites', to: 'favourites#index'
  resources :movies do
    resources :comments, module: :movies
  end
  resources :conversations do
    resources :messages
    collection do
      get :inbox
      get :all, action: :index
      get :sent
      get :trash
    end
  end
  resources :genres
  resources :movie_searches
end
