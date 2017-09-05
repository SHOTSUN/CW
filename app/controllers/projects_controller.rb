class ProjectsController < ApplicationController

  def index
    @project = Project.all.order('created_at DESC')
  end

  def new
    @project = current_user.projects.build

  end

  def create
    @project = current_user.projects.build(project_params)
    @project.save

    redirect_to @project
  end

  def show
    @project = Project.find(params[:id])
  end

  private
    def project_params
      params.require(:project).permit(:title, :body)
    end

end
