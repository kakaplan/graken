class StationMapsController < ApplicationController
  def index
    @stations = Station.all.order(identifier: :asc)
  end
  
  def new
  end

  def edit
  end
end
