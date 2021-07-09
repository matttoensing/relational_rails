Rails.application.routes.draw do
  get '/', to: 'home#index'

  get '/libraries', to: 'libraries#index'
  get '/libraries/new', to: 'libraries#new'
  post '/libraries', to: 'libraries#create'
  get '/libraries/:id', to: 'libraries#show'
  get '/libraries/:id/edit', to: 'libraries#edit', as: 'libraries_edit'
  patch '/libraries/:id', to: 'libraries#update'
  get '/libraries/:library_id/members', to: 'library_members#index'

  get '/authors', to: 'authors#index'
  get '/authors/new', to: 'authors#new'
  post '/authors', to: 'authors#create'
  get '/authors/:id', to: 'authors#show'
  get '/authors/:id/edit', to: 'authors#edit'
  patch '/authors/:id', to: 'authors#update'
  get '/authors/:author_id/books', to: 'author_books#index'


  get '/museums', to: 'museums#index'
  get '/museums/new', to: 'museums#new'
  post '/museums', to: 'museums#create'
  get '/museums/:id', to: 'museums#show'
  get '/museums/:museum_id/exhibits', to: 'museum_exhibits#index'

##############
  get '/members', to: 'members#index'
  get '/members/:id', to: 'members#show'

  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'

  get '/exhibits', to: 'exhibits#index'
  get '/exhibits/:id', to: 'exhibits#show'


end
