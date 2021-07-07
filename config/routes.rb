Rails.application.routes.draw do
  get '/libraries', to: 'libraries#index'
  get '/libraries/new', to: 'libraries#new'
  post '/libraries', to: 'libraries#create'
  get '/libraries/:id', to: 'libraries#show'
  get '/libraries/:id/edit', to: 'libraries#edit', as: 'libraries_edit'
  patch '/libraries/:id', to: 'libraries#update'

  get '/authors', to: 'authors#index'
  get '/authors/:id', to: 'authors#show'

  get '/museums', to: 'museums#index'
  get '/museums/:id', to: 'museums#show'
end
