Rails.application.routes.draw do
  get 'station_maps/index'
  get 'station_maps/new'
  get 'station_maps/edit'
    
  get '/users' => 'users#index' 
  root to: 'stations#index'
end



