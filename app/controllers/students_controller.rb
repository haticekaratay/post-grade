class StudentsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :redirect_if_not_authorized_to_view

    def index
        if params[:course_id]
            @course = Course.find(params[:course_id])
            @students = @course.students.sort_name
            @assignments = @course.assignments.sort_by_due_date
        end
    end
end
