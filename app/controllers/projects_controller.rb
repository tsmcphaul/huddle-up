class ProjectsController < ApplicationController
    before_action :authorized_user

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        if @project.save
            redirect_to projects_path
        else
            flash[:notice] = "Something went wrong"
            render :new
        end
    end

    def index
        @projects = Project.all
        
    end

    def show
        @project = Project.find(params[:id])
        @tasks = @project.tasks
    end

    def update
        if @project.update(project_params)
            redirect_to projects_path
        else
            redirect_to edit_project_path
        end
    end

    def edit
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        redirect_to projects_path
    end

    private
    def project_params
        params.require(:project).permit(:name)
    end
end
