class AssignmentsController < ApplicationController
    def show
        @assignment = Assignment.find(params[:id])
    end

    def new
        @courses= Course.all
        if params[:course_id]
            @assignment = Assignment.new(course_id: params[:course_id])
        else
            @assignment = Assignment.new
        end
    end

    def create
        @assignment = Assignment.new(assignment_params)
        @courses = Course.all
        if @assignment.save
            redirect_to assignment_path(@assignment)           
        else
            render :new
        end
    end

    def edit
        @courses= Course.all
        @assignment = Assignment.find(params[:id])
    end
    
    def update
        @courses= Course.all
        @assignment = Assignment.find(params[:id])
        @assignment.update(assignment_params)
        if @assignment.valid?
            redirect_to assignment_path(@assignment)
        else
            render :edit
        end
        
    end

    def index
        if params[:course_id]
            course = Course.find(params[:course_id])
            @assignments = course.assignments
        else
            @assignments = Assignment.all
        end
    end 

    def destroy
        #binding.pry
        @assignment = Assignment.find(params[:id])
        @assignment.destroy
        redirect_to course_assignments_path(@assignment.course)
    end

    private

    def assignment_params
        params.require(:assignment).permit(:name, :description, :max, :due_date,:course_id)
    end
end