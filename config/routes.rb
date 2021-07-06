Rails.application.routes.draw do
  get '/libraries', to: 'libraries#index'
end
