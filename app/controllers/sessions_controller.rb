class SessionsController < ApplicationController

    def home
        if logged_in?
            redirect_to user_tasks_path            
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			redirect_to user_tasks_path
        else
            flash[:error] = "Couldn't log in.  Try again!"
            redirect_to login_path
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    def omniauth
        @user = User.find_or_create_by(uid: auth['uid'], email: auth['info']['email']) do |u|
            u.password = SecureRandom.hex(16)
            u.username = auth['info']['first_name']
            u.email = auth['email']
        end
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to _user_tasks_path
        else
            flash[:alert] = "Login failed."
            redirect_to root_path
        end
    end


    private
    def auth
        request.env['omniauth.auth']
    end

end