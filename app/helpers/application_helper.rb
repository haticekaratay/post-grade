module ApplicationHelper
    def current_teacher
        @current_teacher ||= Teacher.find_by_id(session[:teacher_id]) if session[:teacher_id]
    end

end
