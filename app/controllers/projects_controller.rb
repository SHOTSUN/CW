class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end



  def show
    @project = Project.find(params[:id])

  end

  private
    def project_params
      params.require(:project).permit(:title, :body, :image)
    end

end
