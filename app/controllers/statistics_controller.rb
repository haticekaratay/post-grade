class StatisticsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @courses = current_teacher.courses
    end 
end