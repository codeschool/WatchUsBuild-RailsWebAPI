ReadingListAPI::Application.routes.draw do

  namespace :api do
    resources :books
    resources :genres
    resources :finished_books
  end

  with_options except: [:create, :update, :destroy] do |read_only|
    read_only.resources :authors
    read_only.resources :genres
  end

  root to: 'home#show'
end
