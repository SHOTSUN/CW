class ProjectsController < ApplicationController

  def index
    @project = Project.all.order('created_at DESC')
  end

  def new

  end

  def create
    @project = Project.new(project_params)
    @project.save

    redirect_to @project
  end

  def show
    @project = Project.find(params[:id])
    @project = Project.order("created_at desc").limit(4).offset(1)

  end

  private
    def project_params
      params.require(:project).permit(:title, :body)
    end

end
