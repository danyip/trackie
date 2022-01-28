Rails.application.routes.draw do

  resources :users, :skills, :projects, :tasks 

end
