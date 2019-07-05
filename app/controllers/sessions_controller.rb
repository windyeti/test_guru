class SessionsController < Devise::SessionsController
  def create
    super
    flash[:warning] = "#{current_user.first_name}, you are log in!!!"
  end
end
