class AssignmentsController < ApplicationController
    include ApplicationHelper
    before_action :redirect_if_not_logged_in

    def show
        @assignment = Assignment.find(params[:id])
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
            redirect_to course_students_path(@course), alert: 'Assignment is successfully created!'       
        else
            render :new
        end

    end

    def edit
        @assignment = Assignment.find(params[:id])
        @students = @assignment.students
    end
    
    def update
        @course = Course.find(params[:course_id])
        @assignment = Assignment.find(params[:id])
        @students = @assignment.students
        @assignment.update(assignment_params)
        if @assignment.valid?
            redirect_to course_students_path(@course), alert: 'Assignment is successfully updated!'
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
        @assignment = Assignment.find(params[:id])
        @assignment.destroy
        redirect_to course_assignments_path(@assignment.course) , alert: 'Assignment is deleted!'
    end

    private

    def assignment_params
        params.require(:assignment).permit(:name, :description, :max, :due_date, student_ids: [])
    end

end