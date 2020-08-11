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
        byebug #I need to build out memebers before chores so chores can be assigned to the current_member
        @chore = Chore.build(chore_params) 
        
        if @chore.save
            redirect_to chore_path(@chore)
        else
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
