class AssignmentsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :redirect_if_not_authorized_to_view, except: :destroy
    before_action :find_assignment, only: [:show,:edit,:update,:destroy]

    def show
    end

    def new
        if params[:course_id]
            @assignment = Assignment.new(course_id: params[:course_id])
            @course = Course.find(params[:course_id])
            @students = @course.students
        end
    end

    def create
        @course = Course.find(params[:course_id])
        @assignment =  @course.assignments.build(assignment_params)
        @students = @course.students
            if @assignment.save
            redirect_to course_students_path(@course), alert: "Assignment - #{@assignment.name} is successfully created!"      
        else
            render :new
        end

    end

    def edit
        @students = @assignment.students
    end
    
    def update
        @course = Course.find(params[:course_id])
        @students = @assignment.students
        @assignment.update(assignment_params)
        if @assignment.valid?
            redirect_to course_students_path(@course), alert: "Assignment - #{@assignment.name} is successfully updated!" 
        else
            render :edit
        end       
    end

    def index
        if params[:course_id]
            @course = Course.find(params[:course_id])
            @assignments = @course.assignments
        end
    end 

    def destroy
        if @assignment.course.teacher_id != current_teacher.id
            redirect_to teacher_path(current_teacher), alert: "You don't have permission to delete this assignment."
        end
        @assignment.destroy
        redirect_to course_assignments_path(@assignment.course) , alert: "Assignment #{@assignment.name} is deleted!"
    end

    private

    def assignment_params
        params.require(:assignment).permit(:name, :description, :max, :due_date, student_ids: [])
    end

    def find_assignment
        @assignment = Assignment.find(params[:id])
    end
end