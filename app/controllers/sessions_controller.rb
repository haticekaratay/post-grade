class SessionsController < ApplicationController
    def home
    end

    def new
        @teacher = Teacher.new
    end

    def create
        #binding.pry
        @teacher = Teacher.find_by(email: params[:teacher][:email])
        if @teacher && @teacher.authenticate(params[:teacher][:password])
            session[:teacher_id] = @teacher.id
            redirect_to teacher_path(@teacher)
        else
            #display an error message saying email or password is not a match!
            redirect_to login_path
        end
    end

    def create_with_google_omniauth
        teacher = Teacher.find_or_create_by(provider: request.env['omniauth.auth']["provider"], uid: request.env['omniauth.auth']["uid"]) do |t|
            t.username = gmail_username
            t.email = gmail
            t.password = "passwordassignedrandomly#*40weqfnhiosd"
            t.save
        end
        if teacher
            session[:teacher_id] = teacher.id
            redirect_to teacher_path(teacher)
        else
            redirect_to login_path
        end
    end

    def destroy
    end

    private
    def gmail_username
        request.env['omniauth.auth']['info']['name']
    end

    def gmail
        request.env['omniauth.auth']['info']['email']
    end
    
end