class CardsController < ApplicationController
    #any action performed to the cards need to be down by the user
    before_action :authenticate_user!
    def index   
    end
    
    #show user's card if present
    def show
        if Card.find_by(user_id: current_user.id).present?
            @card = Card.find_by(user_id: current_user.id)
        else
            flash[:alert] = ["You do not have a card set up yet!"]
        end
    end

    #set up the card if user hasn't already
    def new 
        if Card.find_by(user_id: current_user.id).present? 

            @card = Card.find_by(user_id: current_user.id)
            
            flash[:alert] = ["You already have a card set up!"]
        else
            @card = Card.new(created_at: Time.now, 
                    updated_at: Time.now,
                    user_id: current_user.id)
        end

    end

    #create a new card for that user and show any error messages if present
    def create
        @card = Card.create(params.require(:card).permit(:card_number, :cv,:name,:exp_year,:exp_month,:created_at,:updated_at,:user_id))
        if @card.save
            flash[:notice] = "Card successfully saved"
            redirect_to rentals_path
        else
            if @card.errors.any?
                flash[:alert] = @card.errors.full_messages
            end
            render('new', :status => :unprocessable_entity)
        end

    end
 
    #allow user to edit the card if present 
    def edit 
        if Card.find_by(user_id: current_user.id).present?
            @card = Card.find_by(user_id: current_user.id)
        else
            flash[:alert] = ["You do not have a card set up yet!"]
        end
        
    end

    #save the changes to that card
    def update
        @card = Card.find_by(user_id: current_user.id)
        if @card.update(params.require(:card).permit(:card_number, :cv,:name,:exp_year,:exp_month,:created_at,:updated_at,:user_id))
            redirect_to users_path
        else
            if @card.errors.any?
                flash[:alert] = @card.errors.full_messages
            end
            render('edit', :status => :unprocessable_entity)
        end
    end
end
