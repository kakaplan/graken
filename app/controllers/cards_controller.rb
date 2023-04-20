class CardsController < ApplicationController
    before_action :authenticate_user!
    def index   
    end
    
    def show
        if Card.find_by(user_id: current_user.id).present?
            @card = Card.find_by(user_id: current_user.id)
        else
            flash[:alert] = ["You do not have a card set up yet!"]
        end
    end

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

    def create
        @card = Card.create(params.require(:card).permit(:card_number, :cv,:name,:exp_year,:exp_month,:created_at,:updated_at,:user_id))
        if @card.save
            flash[:notice] = "Payment Successfully Processed"
            redirect_to cards_path
        else
            if @card.errors.any?
                flash[:alert] = @card.errors.full_messages
            end
            render('new', :status => :unprocessable_entity)
        end

    end
 

    def edit 
        if Card.find_by(user_id: current_user.id).present?
            @card = Card.find_by(user_id: current_user.id)
        else
            flash[:alert] = ["You do not have a card set up yet!"]
        end
        
    end

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

    def delete
    end

    def destroy
    end
end
