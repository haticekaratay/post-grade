class SessionsController < ApplicationController
    layout "login"

    def home
    end

    def new
        @teacher = Teacher.new
    end

    def create
        @teacher = Teacher.find_by(email: params[:teacher][:email])
        if @teacher && @teacher.authenticate(params[:teacher][:password])
            session[:teacher_id] = @teacher.id
            redirect_to teacher_path(@teacher)
        else
            redirect_to login_path , alert: 'Invalid Login!Please try again.'
        end
    end

    def create_with_google_omniauth
        teacher = Teacher.from_omniauth(request.env['omniauth.auth'])
        if teacher.valid?
            session[:teacher_id] = teacher.id
            redirect_to teacher_path(teacher)
        else
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:teacher_id)
        redirect_to login_path , alert: "Successfully Logged Out!"
    end

end