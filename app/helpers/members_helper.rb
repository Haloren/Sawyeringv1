module MembersHelper
    
    def current_member
        @current_member ||= Member.find_by_id(session[:member_id]) # if session[:member_id])
    end

    def member_admin?
        !!current_member # !!session[:member_id]
        @current_member.admin? # "permits admin view" : "doesn't show admin abilities"
    end

end
