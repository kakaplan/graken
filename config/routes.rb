Rails.application.routes.draw do
  get 'station_maps/index'
  get 'station_maps/new'
  get 'station_maps/edit'
  
  devise_for :users
    
  get '/users' => 'users#index'
  get '/register' => 'users#register' 
  get '/bikes' => 'bikes#index'
  get '/about' => 'about#index'
  root to: 'stations#index'
end



