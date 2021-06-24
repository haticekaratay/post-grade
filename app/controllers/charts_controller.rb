class ChartsController < ApplicationController
    def statistics_json
        students = Student.all
        render json: students.group(:gender).count
    end
end