Rails.application.routes.draw do
  devise_for :users
    
  get '/users' => 'users#index'
  get '/register' => 'users#register' 
  get '/bikes' => 'bikes#index'
  root to: 'stations#index'
end



