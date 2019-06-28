class ApplicationController < ActionController::Base
  before_action :request_current_url
  before_action :authenticate_user

  helper_method :logged?

  def request_current_url
    p '====================='
    p "#{request.original_url == 'http://localhost:3000/login'}"
    cookies[:wanna_be_here] = request.original_url unless current_url?
    p cookies[:wanna_be_here]
  end

  def authenticate_user
    redirect_to login_path unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end

  def logged?
    session[:user_id].present?
  end

  def current_url?
    request.original_url == 'http://localhost:3000/login' ||
    request.original_url == 'http://localhost:3000/sessions'
  end
end
