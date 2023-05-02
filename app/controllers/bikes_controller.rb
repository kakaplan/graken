class BikesController < ApplicationController
  #only admin allowed to perform actions
    before_action :require_admin

    def index
      @bikes = Bike.all
    end
    
    #show bike for each station
    def show
      @bike = Bike.find(params[:id])
    end

    def new
      @bike = Bike.new
    end

    #create a new bike
    def create
      @bike = Bike.new(bike_params)

      begin
        @bike.save!
        flash.notice = "New bike saved!"
        redirect_to stations_path
      rescue ActiveRecord::RecordInvalid => e
        flash.alert = e
        render 'new', :status => :unprocessable_entity
      end
    end

    #edit a bike
    def edit
      @bike = Bike.find(params[:id])
    end

    def update
      @bike = Bike.find(params[:id])
      if @bike.update(bike_params)
        redirect_to bike_path(@bike)
      else
        render('edit')
      end
    end

    #delete a bike 
    def delete
      @bike = Bike.find(params[:id])
    end

    def destroy
      @bike = Bike.find(params[:id])
      @station = Station.find_by(identifier: @bike.current_station_id)
      @bike.destroy
      redirect_to station_path(@station)
    end

    private

    #bike params
    def bike_params
      params.require(:bike).permit(
        :identifier,
        :current_station_id,
        :theme_name
      )
    end
    
    def require_admin
      unless user_signed_in? and current_user.admin
        flash.alert = "You do not have permission to access the bikes page."
        redirect_to root_path
      end
    end
end
