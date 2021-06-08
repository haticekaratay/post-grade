class SessionsController < ApplicationController
    def home
    end

    def new
        @teacher = Teacher.new
    end

    def create
        #binding.pry
        @teacher = Teacher.find_by_email(email: params[:teacher][:email])
        if @teacher && @teacher.authenticate(params[:teacher][:password])
            session[:teacher_id] = @teacher.id
            redirect_to teacher_path(@teacher)
        else
            #display an error message saying email or password is not a match!
            redirect_to login_path
        end
    end

    def destroy
    end
    
end