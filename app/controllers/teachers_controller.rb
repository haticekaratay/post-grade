class TeachersController < ApplicationController

    def show
        @teacher = Teacher.find(params[:id])
    end
end
