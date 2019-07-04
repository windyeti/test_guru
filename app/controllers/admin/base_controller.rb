class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :require_admin!

  private

  def require_admin!
    redirect_to tests_path, :alert => "You have not permission" unless current_user.is_a?(Admin)
  end

end
