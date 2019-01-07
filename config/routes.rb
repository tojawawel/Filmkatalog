Rails.application.routes.draw do
  root 'movies#index'
  devise_for :users
  resources :movies do
    collection do
      get :autocomplete
    end
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
  get 'favourites/update'
  get 'favourites', to: 'favourites#index'
end
