class ChoresController < ApplicationController

    def index
        @chores = Chores.all 
    end

    def show

    end

    def new
        @chore = Chore.new

        @household = Household.find_by(params[:id]) #maybe make this a helper?
    end

    def create
        @chore = Chore.create(attraction_params)
        redirect_to chore_path(@chore)
    end

    def edit

    end

    def update

    end

    private

    def chore_params
        params.require(:chore).permit(:name, :points, :description)
    end

end
