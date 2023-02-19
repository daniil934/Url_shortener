Rails.application.routes.draw do
  root 'static_pages#home'
  post "/urls/new", to: "urls#create"
  resources :urls, only: [:index, :new, :edit, :show]
end
