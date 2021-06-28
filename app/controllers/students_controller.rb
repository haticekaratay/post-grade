class StudentsController < ApplicationController
    include ApplicationHelper
    before_action :redirect_if_not_logged_in

    def index
        if params[:course_id]
            @course = Course.find(params[:course_id])
            if @course.teacher.id == current_teacher.id
                @students = @course.students.sort_name
                @assignments = @course.assignments.sort_by_due_date
            end
        end
    end
end
