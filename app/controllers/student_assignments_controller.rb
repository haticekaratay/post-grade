class StudentAssignmentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def edit
        @student = Student.find(params[:student_id])
        @assignment = Assignment.find(params[:id])
        redirect_if_not_authorized
        @gradebook_object = StudentAssignment.find_by(
        student_id: params[:student_id], assignment_id: params[:id])
    end

    def update
        @student = Student.find(params[:student_id])
        @gradebook_object = StudentAssignment.find_by(student_id: params[:student_id], assignment_id: params[:id])
        @assignment = Assignment.find(params[:id])
        @gradebook_object.update(gradebook_params)

        redirect_if_not_authorized

        if @gradebook_object.valid? 
            redirect_to course_students_path(@assignment.course)
        else
            render :edit
        end
    end

    private
    
    def gradebook_params
        params.require(:gradebook_object).permit(:grade)
    end

    def redirect_if_not_authorized
        if @assignment.course.teacher.id != current_teacher.id
            redirect_to teacher_path(current_teacher), alert: " You are not allowed to edit this page! Instead, redirected to your dashbord."
        end
    end        
end