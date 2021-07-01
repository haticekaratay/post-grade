class ChartsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def statistics_json
        hash = StudentCourse.group(:course_id).count
        array =  hash.map do |k,v| 
            if find_course(k).teacher_id == current_teacher.id
                [find_course(k).name, v]
            end
        end
        render json: array.to_h
    end

    private

    def find_course(id)
        course = Course.find(id)
    end

end