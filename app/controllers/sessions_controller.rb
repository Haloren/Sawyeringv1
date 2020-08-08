class SessionsController < ApplicationController

    def new
        @household = Household.find_by()
    end

    def destroy
        # byebug
        session.clear

        redirect_to login_path
    end

end