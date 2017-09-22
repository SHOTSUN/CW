class CallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @user.skip_confirmation!
    sign_in_and_redirect @user
  end

  def vkontakte
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @user.skip_confirmation!
    sign_in_and_redirect @user
  end

  def failure
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @user.skip_confirmation!
    sign_in_and_redirect @user

  end

end
