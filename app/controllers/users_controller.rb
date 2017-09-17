class UsersController < ApplicationController
  def show
    @user_project = User.find(current_user).project
  end

  def index
  end

end
