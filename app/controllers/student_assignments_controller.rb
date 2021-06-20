class StudentAssignmentsController < ApplicationController
    def edit
        @student = Student.find(params[:student_id])
        @assignment = Assignment.find(params[:id])
        @gradebook_object = StudentAssignment.find_by(
        student_id: params[:student_id], assignment_id: params[:id])
    end

end