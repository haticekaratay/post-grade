class SessionsController < ApplicationController
    layout "login"
    before_action :redirect_if_not_logged_in, only: :destroy
    before_action :redirect_if_already_logged_in, except: :destroy
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

    private

    def redirect_if_already_logged_in
        if current_teacher
            redirect_to teacher_path(current_teacher), alert: "You are already logged in. Log out before you make this request again. Redirected to your dashboard!"
        end
    end
end