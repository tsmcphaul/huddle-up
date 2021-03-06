class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new
        end

    def show
        @user = User.find(params[:user_id])
    end

    end


    

    private
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
