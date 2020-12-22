class SessionsController < ApplicationController
    def create
        @user = User.find_by(username: params[:username])

        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to users_path
        else 
            message = "Something went wrong! Make sure your username and password are correctly entered in."
            redirect_to login_path, notice: message
        end
    end
end