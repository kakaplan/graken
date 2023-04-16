class RentalsController < ApplicationController
    before_action :authenticate_user!

    def index
        @stations = Station.all.order(identifier: :asc)
    end

    def show
        @station = Station.find(params[:id])
        @bikes = Bike.where(current_station_id: @station.identifier)
    end

    def new 
        if current_user.current_card.present?
            @rental = Rental.new(start_time: Time.now, 
            user_id: current_user.id,
            card_id: current_user.current_card.id,
            bike_id: Bike.find_by(id: params[:rental]).identifier,
            start_station_id: Bike.find_by(id: params[:rental]).current_station.identifier)
        else
            flash[:alert] = "Please setup the payment method before renting!"
            redirect_to new_card_path
        end

    end

    def create
        @rental = Rental.new(params.require(:rental).permit(:start_time,
                                                            :user_id,
                                                            :card_id,
                                                            :bike_id,
                                                            :start_station_id))
        if @rental.save
            flash[:notice] = "Rental was successful"
            bike = Bike.find_by(identifier: params[:rental][:bike_id])
            bike.current_station.docked_bikes.delete(Bike.find_by(id: bike.id))
            redirect_to edit_rental_path(@rental)
        else
            if @rental.errors.any?
                flash[:alert] = @rental.errors.full_messages
            end
            render('new', :status => :unprocessable_entity)
            
        end

    end

    def edit 
        puts("edit page")
        if Rental.find_by_id(params[:id]).present?
            @rental = Rental.find_by_id(params[:id])  
        else
            flash[:alert] = ["You do not have a card set up yet!"]
        end
         
    end

    def update
        station = Station.find_by_id(params[:rental][:end_station_id]) 
        station.docked_bikes << Bike.find_by(identifier: Rental.find_by_id(params[:id]).bike_id)
        Rental.find_by_id(params[:id]).update(end_time: Time.now, status: "closed",
                                            end_station_id: Station.find_by_id(station.identifier))
        redirect_to rentals_path
    end
end




