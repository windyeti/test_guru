class ApplicationController < ActionController::Base
  before_action :authenticate_user

  helper_method :logged?

  def authenticate_user
    cookies[:wanna_be_here] = request.original_url
    redirect_to login_path unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end

  def logged?
    session[:user_id].present?
  end

end
