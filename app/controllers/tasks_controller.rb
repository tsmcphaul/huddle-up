class TasksController < ApplicationController
    before_action :authorized_user

    def new
        if params[:user_id]
            @user = User.find_by(params[:user_id])
            @task = Task.new([project_id: @project.id, user_id: @user.id])
        else 
            @user = nil
            @task = Task.new
        end

    end

    def create 
        @task = Task.new(task_params)
        if @task.save
            redirect_to projects_path
        else
            redirect_to new_task_path
        end
    end

    def index
        @tasks = Task.all
    end

    def show
        #not necessarily needed
    end

    def edit
    end

    def update
        if @task.update(task_params)
            redirect_to projects_path
        else
            redirect_to edit_task_path
        end
    end

    def destroy
        @task.destroy
        redirect_to projects_path
    end

    def finished
        

    private
    def task_params
        params.require(:task).permit(:name, :detail, :project_id, :user_id)
    end
end
