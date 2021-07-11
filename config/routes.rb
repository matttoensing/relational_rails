Rails.application.routes.draw do
  get '/', to: 'home#index'

  get '/libraries', to: 'libraries#index'
  get '/libraries/new', to: 'libraries#new'
  post '/libraries', to: 'libraries#create'
  get '/libraries/:id', to: 'libraries#show'
  get '/libraries/:id/edit', to: 'libraries#edit', as: 'libraries_edit'
  patch '/libraries/:id', to: 'libraries#update'
  delete '/libraries/:id', to: 'libraries#delete'
  get '/libraries/:library_id/members', to: 'library_members#index'
  get '/libraries/:library_id/members/new', to: 'library_members#new'
  post '/libraries/:library_id/members', to: 'library_members#create'

  get '/authors', to: 'authors#index'
  get '/authors/new', to: 'authors#new'
  post '/authors', to: 'authors#create'
  get '/authors/:id', to: 'authors#show'
  get '/authors/:id/edit', to: 'authors#edit'
  patch "/authors/:id", to: 'authors#update'
  delete '/authors/:id', to: 'authors#delete'
  get '/authors/:author_id/books', to: 'author_books#index'
  get '/authors/:author_id/books/new', to: 'author_books#new'
  post '/authors/:author_id/books', to: 'author_books#create'


  get '/museums', to: 'museums#index'
  get '/museums/new', to: 'museums#new'
  post '/museums', to: 'museums#create'
  get '/museums/:id', to: 'museums#show'
  get '/museums/:id/edit', to: 'museums#edit'
  patch 'museums/:id', to: 'museums#update'
  get '/museums/:museum_id/exhibits', to: 'museum_exhibits#index'
  get '/museums/:museum_id/exhibits/new', to: 'museum_exhibits#new'
  post '/museums/:museum_id/exhibits', to: 'museum_exhibits#create'

##############
  get '/members', to: 'members#index'
  get '/members/:id', to: 'members#show'
  get '/members/:id/edit', to: 'members#edit'
  patch '/members/:id', to: 'members#update'

  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/books/:id/edit', to: 'books#edit'
  patch '/books/:id', to: 'books#update'

  get '/exhibits', to: 'exhibits#index'
  get '/exhibits/:id', to: 'exhibits#show'
  get '/exhibits/:id/edit', to: 'exhibits#edit'
  patch '/exhibits/:id', to: 'exhibits#update'


end
