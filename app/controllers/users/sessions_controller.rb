class Users::SessionsController < Devise::SessionsController
  def create
    super
    flash[:success] = t('.welcome', name: current_user.first_name)
  end

end
