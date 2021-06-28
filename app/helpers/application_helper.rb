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

    def redirect_if_not_authorized_to_view
        if current_teacher
            if !current_teacher.course_ids.include?(params[:course_id].to_i) || @course.teacher_id != current_teacher.id || @assignment.course.teacher_id != current_teacher.id || @assignments.first.teacher_id != current_teacher.id 
                redirect_to teacher_path(current_teacher), alert: "You are not allowed to view this page"
            end
        end
    end

end
