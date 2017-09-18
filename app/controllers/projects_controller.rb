class ProjectsController < ApplicationController


  def index
    @project = Project.all.order('created_at DESC')
  end

  def new
    @project = Project.new
  end

  def dest
    @project = Project.find(params[:id]).destroy
    redirect_to user_session_url
  end


  def create
    @project = Project.create(project_params)
    current_user.projects << @project
    if @project.save

      redirect_to projects_path, :notice => "Post has been saved successfully."

      #:flash[:success] = "This account has been blocked..."
      #render  json: { message: "success", projectId: @project.id}, status: 200
    else
      flash[:error] = "Welcome to the Sample App!"
      render json: {error: @project.errors.full_messages.join(", ")}, status: 400
    end

  end

  def show
    @comments = Comment.where(project_id: @project).order("created_at DESC")
    @project = Project.find(params[:id])
    @projects_all = Project.all
    @projects = Project.order("created_at desc").limit(4).offset(1)
  end

  private
    def project_params
      params.require(:project).permit(:title, :body, :image, :pledge)
    end

end
