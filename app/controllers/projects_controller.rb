class ProjectsController < ApplicationController

    def new
        @project = Project.new
    end

    def create
    end

    def index
        @projects = Project.all
    end

    def show
    end

    def update
    end

    def edit
    end

    def destroy
    end

    private
    def project_params
        params.require(:project).permit(:name)
    end
end
