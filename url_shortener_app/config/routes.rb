Rails.application.routes.draw do
  root 'static_pages#home'
  post "/urls/new", to: "urls#create"
  get '/short', to: "short_urls#new"
  post '/short', to: "short_urls#create"
  resources :short_urls, only: [:show]
  resources :urls, only: [:index, :new, :edit, :show]
end
