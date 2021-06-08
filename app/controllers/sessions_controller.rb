class SessionsController < ApplicationController
    def home
    end

    def new
        @teacher = Teacher.new
    end

    
    
end