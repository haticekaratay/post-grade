class AssignmentsController < ApplicationController
    def show
        @assignment = Assignment.find(params[:id])
    end
end