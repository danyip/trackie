Rails.application.routes.draw do

  root to: 'pages#home'

  get '/login'    => 'session#new'    #show the login form
  post '/login'   => 'session#create' #form submits here, performs login, redirect
  delete '/login' => 'session#delete' #logout link goes here, perform logout, redirect
  resources :users, :skills, :projects, :tasks

end
