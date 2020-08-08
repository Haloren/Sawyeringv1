class ApplicationController < ActionController::Base
    helper_method :current_household, :logged_in?

    private

        def current_household
            @current_household ||= Household.find_by_id(session[:household_id]) # if session[:household_id])
        end
    
        def logged_in?
            !!current_household # !!session[:household_id]
        end
    
        def authenticate
            redirect_to '/login' if !logged_in?
        end

end
