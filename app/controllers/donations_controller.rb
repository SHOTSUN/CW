class DonationsController < ApplicationController

  before_action :find_project
  before_action :find_donation, only: [:destroy]

  def create
    @donation = @project.donations.create(params[:donation].permit(:pledge))
    @donation.user_id = current_user.id
    @donation.save

    if @donation.save
      @project.add(@donation.pledge)
      redirect_to project_path(@project)
    else
      render 'new'
    end

  end

  def show
    @donations = Donation.where(project_id: @project).order("created_at DESC")

  end

  def destroy
    @donation.destroy
    redirect_to project_path(@project)

  end


  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_donation
    @donation = @project.donations.find(params[:id])
  end

end
