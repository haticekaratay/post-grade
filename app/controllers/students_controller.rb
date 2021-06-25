class StudentsController < ApplicationController
    def index
        if params[:course_id]
            @course = Course.find(params[:course_id])
            @students = @course.students.sort_name
            @assignments = @course.assignments.sort_by_due_date
        end
        # @students = Course.first.students  # 10 students
        # @assignments = Course.first.assignments
    end
    
end
