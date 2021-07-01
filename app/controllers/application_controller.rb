class ApplicationController < ActionController::Base
    include ApplicationHelper
    def logged_in?
        !!current_teacher
    end
    
    def redirect_if_not_logged_in
        redirect_to login_path, alert: "Please login first." if !logged_in?
    end

    def is_authorized?
        if params[:course_id]
            current_teacher.id == Course.find(params[:course_id]).teacher_id
        elsif params[:id]
            current_teacher.id == params[:id].to_i
        end
    end

    def redirect_if_not_authorized_to_view
        if !is_authorized?
            redirect_to teacher_path(current_teacher), alert: "You are not allowed to view this page!!"
        end  
    end

end
