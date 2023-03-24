class UsersController < ApplicationController

    def index
      @users = Station.all.order(identifier: :asc)

      #TO DO: Create user model/database
    end

    def register
      #TODO: replace Station with User (after User model has been created)
      @user = Station.new
    end
end
