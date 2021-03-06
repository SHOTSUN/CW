class CommentsController < ApplicationController

  before_action :find_project
  before_action :find_comment, only: [:destroy]

  def create
    @comment = @project.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def show
    @comments = Comment.where(project_id: @project).order("created_at DESC")
  end

  def destroy
    @comment.destroy
    redirect_to project_path(@project)
  end


  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_comment
    @comment = @project.comments.find(params[:id])
  end

end
