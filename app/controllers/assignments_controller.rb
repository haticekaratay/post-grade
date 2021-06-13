class AssignmentsController < ApplicationController
    def show
        @assignment = Assignment.find(params[:id])
    end

    def new
        @assignment = Assignment.new
    end

    def create
        assignment = Assignment.new(assignment_params)
        if assignment.save
            redirect_to assignment_path            
        else
            redirect_to new_assignment_path
        end
    end

    private

    def assignment_params
        params.require(:assignment).permit(:name, :description, :max, :due_date)
    end
end