ReadingListAPI::Application.routes.draw do

  resources :books

  with_options except: [:create, :update, :destroy] do |read_only|
    read_only.resources :authors
    read_only.resources :genres
  end
end
