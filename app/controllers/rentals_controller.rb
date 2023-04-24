class RentalsController < ApplicationController
    before_action :authenticate_user!

    def index
        @stations = Station.all.order(identifier: :asc)
    end

    def show
        #shows all the bikes and stations available for renting
        @station = Station.find(params[:id])
        @bikes = Bike.where(current_station_id: @station.identifier)
    end

    def new
        if params[:rental].present?
            #if user does not have a card on file they are redirected to set up the payment first
            if current_user.current_card.present?
                bike = Bike.find_by(id: params[:rental])
                #otherwise a new rental is created using the information that has already been collected
                @rental = Rental.new(start_time: Time.now, 
                user_id: current_user.id,
                card_id: current_user.current_card.id,
                bike_id: bike.identifier,
                start_station_id: bike.current_station.identifier)
            else
                flash[:alert] = "Please setup the payment method before renting!"
                redirect_to new_card_path
            end
        else
            redirect_to station_maps_index_path
            flash[:alert] = "Please select a bike"
        end

    end

    def create
        #creates the rental
        @rental = Rental.new(params.require(:rental).permit(:start_time,
                                                            :user_id,
                                                            :card_id,
                                                            :bike_id,
                                                            :start_station_id))
        #notifies user rental was sucessful
        if @rental.save
            flash[:notice] = "Rental was successful"
            bike = Bike.find_by(identifier: params[:rental][:bike_id])
            bike.current_station.docked_bikes.delete(Bike.find_by(id: bike.id))
            redirect_to edit_rental_path(@rental)
        else
            #if there were errors the user is notified and prompted to make changes accordingly
            if @rental.errors.any?
                flash[:alert] = @rental.errors.full_messages
            end
            render('new', :status => :unprocessable_entity)
            
        end

    end

    def edit 
        #allows user to return the bike
        if Rental.find_by_id(params[:id]).present?
            @rental = Rental.find_by_id(params[:id])  
        else
            flash[:alert] = ["You do not have a rental in progress!"]
        end
        
        # if the rental has already ended, can't edit
        if @rental.end_time
            flash[:alert] = ["This rental has already ended."]
            redirect_to(root_path)
        end
         
    end

    def update
        #if no station was selected the user gets a error 
        if params[:rental][:end_station_id].empty?
            flash[:alert] = ["Please select a station to return the bike"]
            redirect_to edit_rental_path(Rental.find_by_id(params[:id]))

        else
            #otherwise the bike is returned to the selected station
            station = Station.find_by_id(params[:rental][:end_station_id]) 
            station.docked_bikes << Bike.find_by(identifier: Rental.find_by_id(params[:id]).bike_id)
            Rental.find_by_id(params[:id]).update(end_time: Time.now, status: "closed",
                                                end_station_id: station.identifier)
            Rental.find_by_id(params[:id]).save
            #user is returned back to the station list 
            redirect_to rentals_path
        end
    end
end




