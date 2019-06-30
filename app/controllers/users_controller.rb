class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update]
  skip_before_action :authenticate_user, only: [:new, :create]

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, :notice => "Зарегистрировались!"
    else
      flash.now[:warning] = "Регистрация не прошла!"
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to tests_path
    else
      render :edit
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
