class ChartsController < ApplicationController
    def statistics_json
        @students = Student.all
        render json: @students.group(:gender).count
        # respond_to do |format|
        #     format.html
        # end
    end
end