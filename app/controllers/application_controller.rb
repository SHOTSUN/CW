class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types :success, :warning, :danger, :info

  protected
  def authenticate_user!
    redirect_to user_path

  end


end


