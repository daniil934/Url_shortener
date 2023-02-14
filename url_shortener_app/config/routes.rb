Rails.application.routes.draw do
  root 'static_pages#home'
  post '/create', to: 'static_pages#create'
  resources :urls, only: [:create, :edit]
end
