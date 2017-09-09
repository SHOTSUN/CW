class UsersController < ApplicationController
  def show
    @user_projects = User.find(current_user).projects
  end

  def index
  end

end
