Rails.application.routes.draw do
  get 'station_maps/index'
  get 'station_maps/new'
  get 'station_maps/edit'

  resources :cards do
    member do 
      get :delete 
    end
  end
  
  # get 'cards/index'
  # get 'cards/new'
  # get 'cardss/edit'
  # get 'cards/show'
  # get 'cardss/delete'

  devise_for :users

  resources :stations do
    member do
      get :delete
    end
  end

  resources :bikes do
    member do
      get :delete
    end
  end
    
  get '/users' => 'users#index'
  get '/users/account_info'
  get '/users/current_rental'
  get '/users/bike_history'

  get '/register' => 'users#register' 
  get '/bikes' => 'bikes#index'
  get '/faq' => 'faq#index'
  get '/about' => 'about#index'
  #root to: 'stations#index'
  root to: 'station_maps#index'
end



