class RentalsController < ApplicationController
    #rental can only be performed if the user is signed in 
    before_action :authenticate_user!

    #show all the stations 
    def index
        @stations = Station.all.order(identifier: :asc)
    end

    #shows all the bikes and stations available for renting
    def show
        @station = Station.find(params[:id])
        @bikes = Bike.where(current_station_id: @station.identifier)
    end

    #create a new rental
    def new
        #check if a bike is selected to rent
        if params[:rental].present?
            #only allow rental go to through if payment is setup 
            if current_user.current_card.present?
                @bike = Bike.find_by_id(params[:rental])
                @rental = Rental.new(start_time: Time.now, 
                    user_id: current_user.id,
                    card_id: current_user.current_card.id,
                    bike_id: @bike.identifier,
                    start_station_id: @bike.current_station.identifier)
                @start_station = Station.find_by(identifier: @rental.start_station_id)
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
        # attempt card charge
        if not current_user.current_card.charge(5)
            flash[:alert] = "Payment did not go through. Review your card details and try again."
            redirect_to edit_card_path(current_user.current_card) and return
        end

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

    #edit payment information
    def edit 
        #allows user to return the bike
        if Rental.find_by_id(params[:id]).present?
            @rental = Rental.find_by_id(params[:id])
            @bike = Bike.find_by(identifier: @rental.bike_id);  
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




