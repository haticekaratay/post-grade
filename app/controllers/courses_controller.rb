class CoursesController < ApplicationController
    before_action :redirect_if_not_logged_in 
    
    def show
        @course = Course.find(params[:id])
        if @course.teacher_id != current_teacher.id
            redirect_to teacher_path(current_teacher), alert: " You are not allowed to view this page! Instead, redirected to your dashbord."
        end
    end
end
