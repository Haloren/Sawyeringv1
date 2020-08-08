class SessionsController < ApplicationController

    def create
        # byebug
        household = Household.find_by(name: params[:household][:name])
        
        if household && household.authenticate(params[:household][:password])
            session[:household_id] = household.id
            redirect_to household_path(household) #"/households/#{household.id}"
        else
            # byebug
            flash[:message] = " Incorrect email and/or password "
            redirect_to login_path
        end
    
    end

    def destroy
        # byebug
        session.clear

        redirect_to login_path
    end

end