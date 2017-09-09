class ProjectsController < ApplicationController


  def index
    @project = Project.all.order('created_at DESC')
  end

  def new
    @project = Project.new
        #current_user.projects.build

  end

  def create
    @project = Project.new(project_params)
        #current_user.projects.build(project_params)
    #@project.save

    redirect_to @project
  end

  def show
    @project = Project.find(params[:id])
    @projects_all = Project.all
    @projects = Project.order("created_at desc").limit(4).offset(1)
  end

  private
    def project_params
      params.require(:project).permit(:title, :body, :image)
    end

end
