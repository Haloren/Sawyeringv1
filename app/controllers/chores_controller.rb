class ChoresController < ApplicationController

    def index
        @chores = Chore.all 

        @household = current_household
    end

    def show
        @chore = Chore.find_by(id: params[:id])
        # byebug
        @household = current_household
    end

    def new
        @chore = Chore.new

        @household = current_household
    end

    def create
        # byebug
        @chore = Chore.new(chore_params) 
        @chore.save
        
        redirect_to chores_path
    end

    def edit
        @chore = Chore.find_by(id: params[:id])
    end

    def update
        @chore = Chore.find_by(id: params[:id])
        @chore.update(chore_params)
        redirect_to chores_path
    end

    def destroy
        @chore = Chore.find_by(id: params[:id])
        
        @chore.destroy
        redirect_to chores_path
    end

    private

    def chore_params
        params.require(:chore).permit(:name, :points, :description, :member_id)
    end

end
