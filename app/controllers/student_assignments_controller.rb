class StudentAssignmentsController < ApplicationController
    def edit
        @student = Student.find(params[:student_id])
        @assignment = Assignment.find(params[:id])
        @gradebook_object = StudentAssignment.find_by(
        student_id: params[:student_id], assignment_id: params[:id])
    end

    def update
        #binding.pry
        @student = Student.find(params[:student_id])
        gradebook_object = StudentAssignment.find_by(student_id: params[:student_id], assignment_id: params[:id])
        @assignment = Assignment.find(params[:id])
       # binding.pry
        gradebook_object.update(gradebook_params)
        
        if gradebook_object.valid? 
            #binding.pry
            redirect_to course_students_path(@assignment.course)
        else
            render :edit
        end
    end

    def gradebook_params
        params.require(:gradebook_object).permit(:grade)
        #binding.pry
    end

end