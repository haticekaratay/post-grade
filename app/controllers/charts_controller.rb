class ChartsController < ApplicationController
    def new_statistics
        @students = Student.all
        render json: Course.first.students.group(:gender).count
        # respond_to do |format|
        #     format.html
        # end
    end
end