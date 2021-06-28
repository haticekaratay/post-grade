module ApplicationHelper
    def current_teacher
        @current_teacher ||= Teacher.find_by_id(session[:teacher_id]) if session[:teacher_id]
    end

    def logged_in?
        !!current_teacher
    end
    
    def redirect_if_not_logged_in
        redirect_to login_path, alert: "You must login first" if !logged_in?
    end

end
