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
        # @chore.member_id = current_member.id
        # @chore = current_household.created_chores.new(chore_params)
        
        if @chore.save
            redirect_to chores_path
        else
            @household = current_household
            # byebug
            flash[:message] = @chore.errors.full_messages
            render :new #this breaks because of layout @household
        end
 
    end

    def edit
        @chore = Chore.find_by(id: params[:id])
    end

    def update
        @chore = Chore.find_by(id: params[:id])
        if @chore.update(chore_params)
            redirect_to chores_path
        else 
            @household = current_household
            flash[:message] = @chore.errors.full_messages
            redirect_to "/chores/#{@chore.id}" #see if there is a better way to write this member_path(@member)
        end 
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
