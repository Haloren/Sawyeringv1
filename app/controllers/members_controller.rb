class MembersController < ApplicationController

        def show
                @member = Member.find_by(id: params[:id])
                # byebug
                @chores = Chore.all
                #want to be able to call code below, but models are wrong
                # @chores = @member.chore
                
                @household = current_household
        end

        def new
                @member = Member.new

                @household = current_household
        end

        def create
                @member = Member.create(member_params)
                # byebug
                session[:member_id] = @member.id
                params[:member][:admin] == "true" ? @member.admin = true : @member.admin = false
                if @member.save
                        redirect_to household_path(current_household)
                else
                        @household = current_household
                        flash[:message] = @member.errors.full_messages
                        render :new
                end
        end

        def edit
                @member = Member.find_by(id: params[:id])
        end

        def update
                @member = Member.find_by(id: params[:id])
                if @member.update(member_params)
                        redirect_to household_path(current_household)
                else 
                        @household = current_household
                        flash[:message] = @member.errors.full_messages
                        redirect_to "/members/#{@member.id}" #see if there is a better way to write this member_path(@member)
                end 
        end

        def destroy
                # byebug
                @member = Member.find_by_id(params[:id])
                @member.destroy

                redirect_to household_path(current_household)
        end
        

        private

        def member_params
                params.require(:member).permit(:name, :points, :admin)
        end

end
