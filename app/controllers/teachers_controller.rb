class TeachersController < ApplicationController
    include ApplicationHelper
    before_action :redirect_if_not_logged_in, except: :new
    
    def new
        render :layout => "login"
        @teacher = Teacher.new
    end

    def create
        @teacher = Teacher.new(teacher_params)
        if @teacher.save
           session[:teacher_id]= @teacher.id
           redirect_to teacher_path(@teacher)
        else
           render :new , layout: 'login'
        end
    end

    def show
        @teacher = Teacher.find(params[:id])
        if @teacher != current_teacher
            redirect_to teacher_path(@current_teacher), alert: "You are not allowed to view other teachers dashboard"
        end
    end

    private
    def teacher_params
        params.require(:teacher).permit(:username, :email,:password)
    end
end
