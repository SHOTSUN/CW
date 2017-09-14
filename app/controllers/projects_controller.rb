class ProjectsController < ApplicationController


  def index
    @project = Project.new
        #all.order('created_at DESC')
  end

  def new
    @project = current_user.projects.build

  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save

      #redirect_to projects_path, :notice => "Post has been saved successfully."

      flash[:success] = "This account has been blocked..."
      #render  json: { message: "success", projectId: @project.id}, status: 200
    else
      flash[:error] = "Welcome to the Sample App!"
      #render json: {error: @project.errors.full_messages.join(", ")}, status: 400
    end

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
