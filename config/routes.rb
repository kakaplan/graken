Rails.application.routes.draw do
  get 'station_maps/index'
  get 'station_maps/new'
  get 'station_maps/edit'
  
  devise_for :users

  resources :stations do
    member do
      get :delete
    end
  end

  resources :bikes do
    member do
    end
  end
    
  get '/users' => 'users#index'
  get '/register' => 'users#register' 
  get '/bikes' => 'bikes#index'
  root to: 'station_maps#index'
end



