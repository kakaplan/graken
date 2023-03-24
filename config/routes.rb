Rails.application.routes.draw do
  devise_for :users
    
  get '/users' => 'users#index'
  get '/register' => 'users#register' 
  root to: 'stations#index'
end



