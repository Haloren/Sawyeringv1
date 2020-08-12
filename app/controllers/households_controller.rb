class HouseholdsController < ApplicationController

    def new
        @household = Household.new
    end

    def create
        # byebug
        @household = Household.new(household_params)

        if @household.save # @household.valid?
            session[:household_id] = @household.id
            redirect_to household_path(@household) #"/households/#{household.id}"
        else 
            flash[:message] = @household.errors.full_messages
            render :new
        end
    end

    def show
        authenticate

        @members = Member.all

        @household = current_household #.find_by returns nil / .find use a rescue
        
        redirect_to '/login' if !@household 
    end

    private

    def household_params
        params.require(:household).permit(:name, :email, :password)
    end

end
