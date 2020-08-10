class MembersController < ApplicationController

        def new
                @member = Member.new

                @household = Household.find_by(params[:id])
        end

        def create
                @member = Member.create(member_params)
                
                # byebug
                session[:member_id] = @member.id
                params[:member][:admin] == "true" ? @member.admin = true : @member.admin = false
                @member.save
                
                redirect_to member_path(@member)
        end

        def show
                @member = Member.find_by(params[:id])
        end

        private

        def member_params
                params.require(:attraction).permit(:name, :points, :admin)
        end

end
