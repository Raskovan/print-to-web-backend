Rails.application.routes.draw do

  resources :users
  post "/login", to: "auth#create"
  get "/articles", to: "articles#index"
  post "/articles", to: "articles#upload"
  get "/articles/:mag_url/:title", to: "articles#show"
  delete '/articles/:id', to: "articles#destroy"
  patch "/articles/:id", to: "articles#update"
  get 'get_user', to: "auth#show"
  post '/findUser', to: "users#findUser"
  get '/users', to: "users#index"
  post '/images', to: "images#create"
  delete "/images/:id", to: "images#destroy"

end
