class TasksController < ApplicationController
    before_action :authorized_user

    def new
        if params[:user_id]
            @user = User.find(params[:user_id])
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
            flash[:notice] = "Something went wrong"
            render :new
            
        end
    end

    def index
        # if params[:user_id]
            
        #     @user = User.find(params[:id])
        #     @tasks = @user.tasks
            
        # else
            @tasks = Task.all
           
           
        # end
    end

    def show
        @task = Task.find_by(id: params[:id])
        @tasks = Task.all
          
    end

    def edit
        @task = Task.find(params[:id])
    
    end

    def update
        @task = Task.find(params[:id])
        if @task.update(task_params)
            redirect_to user_tasks_path(:user_id)
        else
            redirect_to edit_task_path
        end
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to user_tasks_path(:user_id)
    end

    # def completed
    #     @task = Task.completed
    # end

    def unfinished
        @tasks = Task.all.unfinished
    end



    private
    def task_params
        params.require(:task).permit(:name, :detail, :project_id, :user_id, :finished)
    end
end
