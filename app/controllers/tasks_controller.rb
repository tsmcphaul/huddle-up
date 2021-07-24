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

    def new_user_task
        if params[:id].present?
            params[:id] == current_user.id
            @user = current_user
            @task = Task.new
            render :new_user_task
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
 
            @user = User.find(params[:id])
            
            @tasks = @user.tasks
    end

    def user_tasks_index
        if params[:id].present?
            if params[:id] == current_user.id
                @tasks = current_user.tasks
                render :index
            else
                @user = User.find(params[:id])
                @tasks = @user.tasks
                render :index
            end
        end
    end


    def show
        @task = Task.find_by(params[:id])
        # @tasks = Task.all
          
    end

    def edit
        @task = Task.find(params[:id])
    
    end

    def update
        @task = Task.find(params[:id])
        if @task.update(task_params)
            redirect_to user_tasks_path(current_user)
        else
            redirect_to edit_task_path
        end
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to user_tasks_path(current_user)
    end

    # def completed
    #     @task = Task.completed
    # end

    def unfinished
        @tasks = current_user.tasks.unfinished
    end

    def mvp
        @user = User.all.sort_by {|user| user.tasks.unfinished.count}.last
    end



    private
    def task_params
        params.require(:task).permit(:name, :detail, :project_id, :user_id, :finished)
    end
end
