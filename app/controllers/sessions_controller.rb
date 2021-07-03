class SessionsController < ApplicationController

    def home
        if logged_in?
            redirect_to user_tasks_path(:user_id)            
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			redirect_to user_tasks_path(:user_id)
        else
            flash[:notice] = "Couldn't log in.  Try again!"
            render :new
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

    def omniauth
        
        @user = User.find_or_create_by(uid: auth['uid'], email: auth['info']['email']) do |u|
            u.password = SecureRandom.hex(16)
            u.name = auth['info']['name']
            u.email = auth['info']['email']
        end
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_tasks_path(:user_id)
        else
            flash[:alert] = "Login failed."
            render :login
        end
    end


    private
    def auth
        request.env['omniauth.auth']
    end

end