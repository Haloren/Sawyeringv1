class ApplicationController < ActionController::Base
    # before_action :authenticate #this is currently causing to many redirects and breaking (I might have a loop?)
    
    helper_method :current_household, :logged_in?


    private

        def current_household
            @current_household ||= Household.find_by_id(session[:household_id]) # if session[:household_id])
        end
    
        def logged_in?
            !!current_household # !!session[:household_id]
        end
    
        def authenticate
            redirect_to login_path if !logged_in?
        end

end
