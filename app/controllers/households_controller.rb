class HouseholdsController < ApplicationController

    def new
        @household = Household.new
    end

    def create
        # byebug
        @household = Household.new(household_params)

        if @household.save
            session[:household_id] = @household.id
            redirect_to @household 
        else 
            render :new
        end
    end

    def show
        @household = Household.find_by(params[:id]) #.find_by returns nil / .find use a rescue
        
        redirect_to '/login' if !@household 
    end

    private

    def household_params
        params.require(:household).permit(:name, :email, :password)
    end

end
