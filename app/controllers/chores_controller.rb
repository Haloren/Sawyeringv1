class ChoresController < ApplicationController

    def index
        @chores = Chore.all 

        @household = Household.find_by(params[:id])
    end

    def show

    end

    def new
        @chore = Chore.new

        @household = Household.find_by(params[:id]) #maybe make this a helper?
    end

    def create
        byebug #No params are coming over?
        @chore = Chore.new(chore_params) 
        
        if @chore.save
            session[:chore_id] = @chore.id
            redirect_to chore_path(@chore)
        else
            flash[:message] = @household.errors.full_messages
            render :new
        end
    end

    def edit
        @chore = Chore.find_by(params[:id])
    end

    def update
        @chore = Chore.find_by(params[:id])
        @chore.update(chore_params)
        redirect_to chore_path(@chore)
    end

    private

    def chore_params
        params.require(:chore).permit(:name, :points, :description)
    end

end
