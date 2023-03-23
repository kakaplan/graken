class UsersController < ApplicationController

    def index
        @users = Station.all.order(identifier: :asc)

        #TO DO: Create user model/database
      end
end
