Rails.application.routes.draw do
  get '/', to: 'home#index'
  
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

  get '/libraries/:library_id/members', to: 'library_members#index'

  get '/authors/:author_id/books', to: 'author_books#index'

  get '/museums/:museum_id/exhibits', to: 'museum_exhibits#index'

  get '/members', to: 'members#index'
  get '/members/:id', to: 'members#show'

  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'

  get '/exhibits', to: 'exhibits#index'
  get '/exhibits/:id', to: 'exhibits#show'

end
