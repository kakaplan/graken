class BikesController < ApplicationController
    before_action :require_admin

    def index
      @bikes = Bike.all
    end

    def show
      @bike = Bike.find(params[:id])
    end

    def new
      @bike = Bike.new
    end

    def create
      @bike = Bike.new(bike_params)

      begin
        @bike.save!
        flash.notice = "New bike saved!"
        # TODO: redirect back to show the bike instance we just created
        redirect_to stations_path
      rescue ActiveRecord::RecordInvalid => e
        flash.alert = e
        render 'new', :status => :unprocessable_entity
      end
    end

    def edit
      @bike = Bike.find(params[:id])
    end

    # TODO: use update! instead of update (to ensure errors show)
    # Also change this for stations
    def update
      @bike = Bike.find(params[:id])
      if @bike.update(bike_params)
        redirect_to bike_path(@bike)
      else
        render('edit')
      end
    end

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

    def bike_params
      params.require(:bike).permit(
        :identifier,
        :current_station_id,
        :status,
        :battery,
        :mileage,
        :theme_name
      )
    end
    
    # TODO: should this method go somewhere else? Since it's also in stations_controller
    # TODO: the error is not showing up, it's just redirecting
    def require_admin
      unless user_signed_in? and current_user.admin
        flash[:error] = "You do not have permission to access this page."
        redirect_to root_path
      end
    end
end
