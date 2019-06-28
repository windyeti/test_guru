class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to cookies[:wanna_be_here], :notice => "Залогинились!"
    else
      flash.now[:warning] = "Залогиниться не получилось!"
      render :new
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path, :flash => { :warning => "Разлогинились!" }
  end
end
