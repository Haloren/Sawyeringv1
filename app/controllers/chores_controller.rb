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
        params.require(:chore).permit(:name, :points, :description)
    end

end
